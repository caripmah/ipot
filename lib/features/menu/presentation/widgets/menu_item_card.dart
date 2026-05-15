import 'package:flutter/material.dart';
import '../../../../data/models/menu_models.dart';
import 'customization_bottom_sheet.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const kPrimary = Color(0xFF0A1128);
    const kAccent = Color(0xFF4A6CF7);
    final isPopular = item.id % 3 == 0; // Just for visual demo

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: kPrimary.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () => _showCustomizationSheet(context),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Image with colored background
                  Hero(
                    tag: 'menu_item_${item.id}',
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        color: _getItemColor(item.id).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: item.imageUrl != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                item.imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => _buildPlaceholder(item),
                              ),
                            )
                          : _buildPlaceholder(item),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: kPrimary,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                            fontSize: 13,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '\$${item.price.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: kAccent,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: kAccent,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: kAccent.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isPopular)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB74D),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFB74D).withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.white, size: 12),
                    SizedBox(width: 4),
                    Text(
                      'POPULAR',
                      style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 0.5),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(MenuItem item) {
    return Center(
      child: Icon(
        _getItemIcon(item.categoryId),
        size: 40,
        color: _getItemColor(item.id),
      ),
    );
  }

  Color _getItemColor(int id) {
    final colors = [
      const Color(0xFFFFB74D), // Orange
      const Color(0xFF81C784), // Green
      const Color(0xFF64B5F6), // Blue
      const Color(0xFFE57373), // Red
      const Color(0xFFBA68C8), // Purple
      const Color(0xFF4DB6AC), // Teal
    ];
    return colors[id % colors.length];
  }

  IconData _getItemIcon(int categoryId) {
    switch (categoryId) {
      case 1:
        return Icons.local_cafe_rounded; // Appetizers
      case 2:
        return Icons.restaurant_rounded; // Main Course
      case 3:
        return Icons.local_drink_rounded; // Drinks
      default:
        return Icons.restaurant_menu_rounded;
    }
  }

  void _showCustomizationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomizationBottomSheet(item: item),
    );
  }
}
