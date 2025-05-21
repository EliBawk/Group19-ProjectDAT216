import 'package:api_test/model/imat/product.dart';
import 'package:api_test/model/imat/shopping_item.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final isFavorite = iMat.favorites.contains(product);

    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // Product detail view could be added here
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  AspectRatio(
                    aspectRatio: 1,
                    child: iMat.getImage(product),
                  ),
                  const SizedBox(height: 3),
                  
                  // Product Name
                  Text(
                    product.name ?? 'No Name',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: compact ? 14 : 16,
                      fontWeight: FontWeight.w600,
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
                          fontSize: compact ? 14 : 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        iconSize: compact ? 18 : 18,
                      
                        onPressed: () {
                          iMat.shoppingCartRemove(ShoppingItem(product));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Removed ${product.name} from cart'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        iconSize: compact ? 18 : 18,
                        onPressed: () {
                          iMat.shoppingCartAdd(ShoppingItem(product));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added ${product.name} to cart'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Favorite button
            Positioned(
              top: 4,
              right: 4,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.red[600],
                ),
                onPressed: () {
                  iMat.toggleFavorite(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}