import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/menu_models.dart';
import '../../../../data/models/cart_models.dart';
import '../../../cart/bloc/cart_cubit.dart';

class CustomizationBottomSheet extends StatefulWidget {
  final MenuItem item;

  const CustomizationBottomSheet({super.key, required this.item});

  @override
  State<CustomizationBottomSheet> createState() => _CustomizationBottomSheetState();
}

class _CustomizationBottomSheetState extends State<CustomizationBottomSheet> {
  final Map<int, List<CustomizationOption>> _selectedOptionsByGroup = {};
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    for (final group in widget.item.customizationGroups) {
      if (group.required && group.options.isNotEmpty) {
        _selectedOptionsByGroup[group.id] = [group.options.first];
      } else {
        _selectedOptionsByGroup[group.id] = [];
      }
    }
  }

  double get _totalPrice {
    double optionsPrice = 0;
    for (final options in _selectedOptionsByGroup.values) {
      for (final opt in options) {
        optionsPrice += opt.priceModifier;
      }
    }
    return (widget.item.price + optionsPrice) * _quantity;
  }

  bool _isGroupValid(CustomizationGroup group) {
    if (!group.required) return true;
    final selected = _selectedOptionsByGroup[group.id] ?? [];
    return selected.isNotEmpty;
  }

  bool get _isAllValid {
    return widget.item.customizationGroups.every(_isGroupValid);
  }

  @override
  Widget build(BuildContext context) {
    const kPrimary = Color(0xFF0A1128);
    const kAccent = Color(0xFF4A6CF7);

    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.item.description,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.4),
                      ),
                    ],
                  ),
                ),
                if (widget.item.imageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.item.imageUrl!, width: 90, height: 90, fit: BoxFit.cover),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(height: 1),

          // Customization Groups
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: widget.item.customizationGroups.length,
              itemBuilder: (context, index) {
                final group = widget.item.customizationGroups[index];
                return _buildGroup(group);
              },
            ),
          ),

          // Quantity & Add to Cart
          _buildFooter(kPrimary, kAccent),
        ],
      ),
    );
  }

  Widget _buildGroup(CustomizationGroup group) {
    const kPrimary = Color(0xFF0A1128);
    final selected = _selectedOptionsByGroup[group.id] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              Text(
                group.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimary),
              ),
              if (group.required)
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'REQUIRED',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                ),
            ],
          ),
        ),
        ...group.options.map((opt) {
          final isSelected = selected.contains(opt);
          final isRadio = group.maxSelections == 1;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: InkWell(
              onTap: () => _toggleOption(group, opt),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? const Color(0xFF4A6CF7) : Colors.transparent,
                    width: 2,
                  ),
                  color: isSelected ? const Color(0xFF4A6CF7).withValues(alpha: 0.05) : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(
                      isRadio 
                        ? (isSelected ? Icons.radio_button_checked : Icons.radio_button_off)
                        : (isSelected ? Icons.check_box : Icons.check_box_outline_blank),
                      color: isSelected ? const Color(0xFF4A6CF7) : Colors.grey[400],
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        opt.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? const Color(0xFF4A6CF7) : Colors.grey[800],
                        ),
                      ),
                    ),
                    if (opt.priceModifier > 0)
                      Text(
                        '+\$${opt.priceModifier.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: isSelected ? const Color(0xFF4A6CF7) : Colors.green[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
      ],
    );
  }

  void _toggleOption(CustomizationGroup group, CustomizationOption opt) {
    setState(() {
      final selected = _selectedOptionsByGroup[group.id] ?? [];
      if (group.maxSelections == 1) {
        _selectedOptionsByGroup[group.id] = [opt];
      } else {
        if (selected.contains(opt)) {
          selected.remove(opt);
        } else if (selected.length < group.maxSelections) {
          selected.add(opt);
        }
        _selectedOptionsByGroup[group.id] = List.from(selected);
      }
    });
  }

  Widget _buildFooter(Color kPrimary, Color kAccent) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, -10)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle_outline, color: kPrimary),
                  onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                ),
                Text(
                  '$_quantity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimary),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: kPrimary),
                  onPressed: () => setState(() => _quantity++),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccent,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              onPressed: _isAllValid ? _addToCart : null,
              child: Text(
                'Add to Cart - \$${_totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addToCart() {
    final options = <SelectedOption>[];
    _selectedOptionsByGroup.forEach((groupId, opts) {
      for (final opt in opts) {
        options.add(SelectedOption(groupId: groupId, option: opt));
      }
    });

    final cartCubit = context.read<CartCubit>();
    for (int i = 0; i < _quantity; i++) {
      cartCubit.addItem(widget.item, options);
    }
    
    Navigator.pop(context);
  }
}
