import 'package:flutter/material.dart';
import '../../../data/models/menu_models.dart';
import '../../../data/models/cart_models.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/di/injection.dart';
import '../../cart/bloc/cart_cubit.dart';

class CustomizationBottomSheet extends StatefulWidget {
  final MenuItem item;

  const CustomizationBottomSheet({super.key, required this.item});

  @override
  State<CustomizationBottomSheet> createState() =>
      _CustomizationBottomSheetState();
}

class _CustomizationBottomSheetState extends State<CustomizationBottomSheet> {
  // groupId → selected option ids
  final Map<int, Set<int>> _selections = {};

  @override
  Widget build(BuildContext context) {
    final totalModifier = _selections.values
        .expand((ids) => ids)
        .map((id) => _findOption(id)?.priceModifier ?? 0.0)
        .fold(0.0, (a, b) => a + b);
    final totalPrice = widget.item.price + totalModifier;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.4,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.format(totalPrice),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),
              // Customization groups
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: widget.item.customizationGroups.map((group) {
                    return _GroupSection(
                      group: group,
                      selections: _selections[group.id] ?? {},
                      onToggle: (optionId) => _toggleOption(group, optionId),
                    );
                  }).toList(),
                ),
              ),
              // Add to cart button
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _canAdd ? _addToCart : null,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Add to Cart · ${CurrencyFormatter.format(totalPrice)}',
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  bool get _canAdd {
    // All required groups must have a selection
    return widget.item.customizationGroups
        .where((g) => g.required)
        .every((g) => _selections[g.id]?.isNotEmpty == true);
  }

  void _toggleOption(CustomizationGroup group, int optionId) {
    setState(() {
      _selections.putIfAbsent(group.id, () => {});
      final set = _selections[group.id]!;

      if (group.maxSelections == 1) {
        set
          ..clear()
          ..add(optionId);
      } else {
        if (set.contains(optionId)) {
          set.remove(optionId);
        } else if (set.length < group.maxSelections) {
          set.add(optionId);
        }
      }
    });
  }

  CustomizationOption? _findOption(int optionId) {
    for (final group in widget.item.customizationGroups) {
      for (final opt in group.options) {
        if (opt.id == optionId) return opt;
      }
    }
    return null;
  }

  void _addToCart() {
    final selectedOptions = <SelectedOption>[];
    _selections.forEach((groupId, optionIds) {
      for (final optId in optionIds) {
        final opt = _findOption(optId);
        if (opt != null) {
          selectedOptions.add(SelectedOption(groupId: groupId, option: opt));
        }
      }
    });

    getIt<CartCubit>().addItem(widget.item, selectedOptions);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.item.name} added to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class _GroupSection extends StatelessWidget {
  final CustomizationGroup group;
  final Set<int> selections;
  final ValueChanged<int> onToggle;

  const _GroupSection({
    required this.group,
    required this.selections,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(group.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(width: 8),
            if (group.required)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('Required',
                    style: TextStyle(
                        fontSize: 10,
                        color:
                            Theme.of(context).colorScheme.onErrorContainer)),
              ),
            if (!group.required)
              Text(' (Optional)',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey)),
          ],
        ),
        Text(
          group.maxSelections == 1
              ? 'Choose 1'
              : 'Choose up to ${group.maxSelections}',
          style:
              Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 8),
        ...group.options.map((opt) {
          final isSelected = selections.contains(opt.id);
          return ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: group.maxSelections == 1
                ? Radio<int>(
                    value: opt.id,
                    groupValue: selections.firstOrNull,
                    onChanged: (_) => onToggle(opt.id),
                  )
                : Checkbox(
                    value: isSelected,
                    onChanged: (_) => onToggle(opt.id),
                  ),
            title: Text(opt.name),
            trailing: opt.priceModifier != 0
                ? Text(
                    CurrencyFormatter.formatDiff(opt.priceModifier),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : null,
            onTap: () => onToggle(opt.id),
          );
        }),
        const Divider(height: 24),
      ],
    );
  }
}
