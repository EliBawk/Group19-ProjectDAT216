import 'package:api_test/model/imat/product.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:api_test/widgets/lower_header.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:provider/provider.dart';
import 'package:api_test/pages/main_view.dart';

import '../model/imat/shopping_item.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            onAccountPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountView())),
            onCartPressed: () {}, onCategoriesPressed: () {  }, // Already on checkout page
          ),
          
          Expanded(
            child: _buildCheckoutContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutContent(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();
    final cart = iMat.getShoppingCart();
    final items = cart.items;
    final total = _safeToDouble(cart.totalPrice);

    double totalCost = 0;
    for (final item in items) {
      final price = _safeToDouble(item.product.price);
      final amount = item.amount is int ? item.amount : int.tryParse(item.amount.toString()) ?? 1;
      totalCost += price * amount;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Din varukorg',
              style: GoogleFonts.reemKufi(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Column headers
            const _CartHeaderRow(),
            const Divider(thickness: 2),

            // Cart items
            for (final item in items) ...[
              _CartItemRow(
                item: item,
                onIncrease: () => iMat.shoppingCartAdd(item), 
                onDecrease: () => iMat.shoppingCartRemove(item), iMat: iMat,  
                
                
              ),
              const Divider(),
            ],

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Totalt:',
                          style: GoogleFonts.reemKufi(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _formatCurrency(totalCost),
                          style: GoogleFonts.reemKufi(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Varav moms:',
                          style: GoogleFonts.reemKufi(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          _formatCurrency(totalCost * 0.25), // Assuming 25% VAT
                          style: GoogleFonts.reemKufi(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            
            const SizedBox(height: 10),
            
            const Divider(),

            // Buttons row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainView()),
                  );
                },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Color(0xFF3D5430)),
                    ),
                    child: Text(
                      'Fortsätt handla',
                      style: GoogleFonts.reemKufi(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D5430)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () { iMat.placeOrder();
                      
                      // Checkout logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D5430),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Till kassan',
                      style: GoogleFonts.reemKufi(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to safely convert to double
  double _safeToDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  // Helper method to format currency
  String _formatCurrency(double value) {
    return '${value.toStringAsFixed(2)} kr';
  }
}

class _CartHeaderRow extends StatelessWidget {
  const _CartHeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 3, child: Container()),
        Expanded(
          flex: 2,
          child: Text(
            'Ord.pris',
            style: GoogleFonts.reemKufi(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Antal',
            style: GoogleFonts.reemKufi(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Summa',
            style: GoogleFonts.reemKufi(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class _CartItemRow extends StatefulWidget {
  final ShoppingItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  
  final ImatDataHandler iMat;


  const _CartItemRow({
    required this.item,
    required this.onIncrease,
    required this.onDecrease, 
    required this.iMat,

  });

  @override
  State<_CartItemRow> createState() => _CartItemRowState();
}

class _CartItemRowState extends State<_CartItemRow> {
  late Product product;

  @override
  Widget build(BuildContext context) {
    final price = _safeToDouble(widget.item.product.price);
    final amount = widget.item.amount is int ? widget.item.amount : int.tryParse(widget.item.amount.toString()) ?? 1;
    final total = price * amount;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.product.name,
                style: GoogleFonts.reemKufi(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            _formatCurrency(price),
            style: GoogleFonts.reemKufi(fontSize: 16),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: amount > 1 ? widget.onDecrease : null, // Disable if amount would go below 1
                splashRadius: 20,
              ),
              Text(
                '$amount',
                style: GoogleFonts.reemKufi(fontSize: 16),
              ),
              IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                  widget.iMat.shoppingCartAdd(ShoppingItem(widget.item.product)); // Modified to match product tile
                  setState(() {}); // Added to force UI update
                },
              splashRadius: 20,
            ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatCurrency(total),
                style: GoogleFonts.reemKufi(fontSize: 16),
              ),
              
            ],
          ),
        ),
      ],
    );
  }

  double _safeToDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  String _formatCurrency(double value) {
    return '${value.toStringAsFixed(2)} kr';
  }
}

