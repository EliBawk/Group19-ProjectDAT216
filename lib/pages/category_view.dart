import 'package:api_test/app_theme.dart';
import 'package:api_test/model/imat/product.dart';
import 'package:api_test/model/imat/util/functions.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/pages/history_view.dart';
import 'package:api_test/widgets/cart_view.dart';
import 'package:api_test/widgets/category_tile.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:api_test/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var products = iMat.selectProducts;

    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
  onAccountPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AccountView()),
    );
  },
  onCartPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartView()),
    );
  },

onCategoriesPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryView()), // Exempel: kategorier = startsidan
              );
            },
            onFavoritesPressed: iMat.selectFavorites, ),

          SizedBox(height: AppTheme.paddingMedium),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                SizedBox(
                  width: 1200,
                  //height: 400,
                  child: _centerStage(context, products),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _shoppingCart(ImatDataHandler iMat) {
    return Column(
      children: [
        Text('Kundvagn',style: GoogleFonts.reemKufi(),),
        SizedBox(height: 500, child: CartView()),
        FilledButton(
          
          onPressed: () {
            iMat.placeOrder();
          },
          child: Text('Köp!'),
        ),
      ],
    );
  }

  
  


  Widget _centerStage(BuildContext context, List<Product> products) {
  return GridView.builder(
    padding: const EdgeInsets.all(4),  // Reduced padding
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,  // Five columns
      crossAxisSpacing: 30,  // Reduced spacing
      mainAxisSpacing: 30,  // Reduced spacing
      childAspectRatio: 0.7,  // More rectangular shape to fit content
    ),
    itemCount: products.length,
    itemBuilder: (BuildContext context, int index) {
      return CategoryTile(
        products[index],
        compact: true,  // Assuming ProductTile accepts this parameter
      );
    },
  );
}

  void _showAccount(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountView()),
    );
  }

  void _showHistory(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryView()),
    );
  }
}
