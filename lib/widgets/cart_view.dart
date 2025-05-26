import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/widgets/delete_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var items = iMat.getShoppingCart().items;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        for (final item in items)
          // Wrapper som fixar bredd och alignment höger
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              // Card bredd = skärmbredd minus 32 px (16 px padding på vardera sida)
              width: screenWidth - 32,
              padding: const EdgeInsets.only(right: 16), // 16 px padding från höger
              child: Card(
                child: ListTile(
                  title: Text(
                    item.product.name,
                    style: GoogleFonts.reemKufi(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    '${item.amount}  st',
                    style: GoogleFonts.reemKufi(fontSize: 18),
                  ),
                  trailing: DeleteButton(
                    onPressed: () {
                      iMat.shoppingCartClear(item);
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
