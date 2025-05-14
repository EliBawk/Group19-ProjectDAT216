import 'package:api_test/model/imat/product.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final bool compact;
  
  const ProductTile(
    this.product, {
    this.compact = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iMat = Provider.of<ImatDataHandler>(context, listen: false);
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // Add your onTap functionality here
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image - with fixed height to control card size
              SizedBox(
                height: compact ? 120 : 180,  // Taller for wider cards
                child: Center(child: iMat.getImage(product)),
              ),
              const SizedBox(height: 8),
              
              // Product Name
              Text(
                product.name ?? 'No Name',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 14 : 16,  // Slightly larger text
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              
              // Price and Add Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price?.toStringAsFixed(2) ?? '0.00'} SEK',
                    style: TextStyle(
                      fontSize: compact ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart, 
                      size: compact ? 20 : 24),
                    onPressed: () {
                      // Add to cart functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}