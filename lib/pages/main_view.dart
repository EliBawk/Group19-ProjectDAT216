import 'package:api_test/app_theme.dart';
import 'package:api_test/model/imat/product.dart';
import 'package:api_test/model/imat/util/functions.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/pages/history_view.dart';
import 'package:api_test/widgets/cart_view.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:api_test/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var products = iMat.selectProducts;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: AppTheme.paddingLarge),
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
                MaterialPageRoute(builder: (context) => const MainView()), // Exempel: kategorier = startsidan
              );
            }, ),

          SizedBox(height: AppTheme.paddingMedium),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _leftPanel(iMat),
                SizedBox(
                  width: 800,
                  //height: 400,
                  child: _centerStage(context, products),
                ),
                SizedBox(
                  width: 450,
                  //color: Colors.blueGrey,
                  child: _shoppingCart(iMat),
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
        Text('Kundvagn'),
        SizedBox(height: 600, child: CartView()),
        FilledButton(
          
          onPressed: () {
            iMat.placeOrder();
          },
          child: Text('Köp!'),
        ),
      ],
    );
  }

  Container _leftPanel(ImatDataHandler iMat) {
    return Container(
      width: 200,
      color: const Color.fromARGB(255, 255, 0, 0),
      child: SingleChildScrollView(
        child: 
      Column(
        children: [
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                iMat.selectAllProducts();
              },
              child: Text('Visa allt'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Favoriter');
                iMat.selectFavorites();
              },
              child: Text('Favoriter'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                var products = iMat.products;
                iMat.selectSelection([
                  products[4],
                  products[45],
                  products[68],
                  products[102],
                  products[110],
                ]);
              },
              child: Text('Urval'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.CABBAGE),
                );
              },
              child: Text('Grönsaker'),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.POD),
                );
              },
              child: Text('Balgväxter'),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.BREAD),
                );
              },
              child: Text('Bröd'),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.BERRY),
                );
              },
              child: Text('Bär'),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.CITRUS_FRUIT),
                );
              },
              child: Text('Citrusfrukter'),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.HOT_DRINKS),
                );
              },
              child: Text('Kaffe/te'),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.COLD_DRINKS),
                );
              },
              child: Text('Kalla drycker'),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.EXOTIC_FRUIT),
                );
              },
              child: Text('Exotiska frukter'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.FISH),
                );
              },
              child: Text('Fisk'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.VEGETABLE_FRUIT),
                );
              },
              child: Text('Fruktgrönsaker'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.MEAT),
                );
              },
              child: Text('Kött'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.DAIRIES),
                );
              },
              child: Text('Mejeriprodukter'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.MELONS),
                );
              },
              child: Text('Meloner'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Söktest');
                iMat.selectSelection(iMat.findProducts('mj'));
              },
              child: Text('Söktest'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.FLOUR_SUGAR_SALT),
                );
              },
              child: Text('Mjöl/socker/salt'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.NUTS_AND_SEEDS),
                );
              },
              child: Text('Nötter och frön'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.PASTA),
                );
              },
              child: Text('Pasta'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.POTATO_RICE),
                );
              },
              child: Text('Potatis/ris'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.ROOT_VEGETABLE),
                );
              },
              child: Text('Meloner'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.MELONS),
                );
              },
              child: Text('Meloner'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.MELONS),
                );
              },
              child: Text('Meloner'),
            ),
          ),
        ],
      ),
      ),
    );
  }


  Widget _centerStage(BuildContext context, List<Product> products) {
  return GridView.builder(
    padding: const EdgeInsets.all(4),  // Reduced padding
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,  // Five columns
      crossAxisSpacing: 4,  // Reduced spacing
      mainAxisSpacing: 4,  // Reduced spacing
      childAspectRatio: 0.5,  // More rectangular shape to fit content
    ),
    itemCount: products.length,
    itemBuilder: (BuildContext context, int index) {
      return ProductTile(
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
