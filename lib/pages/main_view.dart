import 'package:api_test/app_theme.dart';
import 'package:api_test/model/imat/product.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/pages/history_view.dart';
import 'package:api_test/widgets/cart_view.dart';
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
          // Header Row
          SizedBox(height: AppTheme.paddingLarge),
          _header(context),
          SizedBox(height: AppTheme.paddingMedium),
          
          // Main Content Area
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Panel (Filters)
                _leftPanel(iMat),
                
                // Center Stage (Products) - Wider now
                SizedBox(
                  width: 700,  // Increased from 580
                  child: _centerStage(context, products),
                ),
                
                // Right Column (User and Cart)
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      // User Account Section
                      ElevatedButton(
                        onPressed: () => _showAccount(context),
                        child: const Text('Användare'),
                      ),
                      SizedBox(height: AppTheme.paddingMedium),
                      
                      // Purchase History
                      ElevatedButton(
                        onPressed: () => _showHistory(context),
                        child: const Text('Köphistorik'),
                      ),
                      SizedBox(height: AppTheme.paddingMedium),
                      
                      // Shopping Cart - Now below user and history
                      const Text('Kundvagn'),
                      SizedBox(height: AppTheme.paddingSmall),
                      Expanded(
                        child: CartView(),
                      ),
                      SizedBox(height: AppTheme.paddingSmall),
                      ElevatedButton(
                        onPressed: () => iMat.placeOrder(),
                        child: const Text('Köp!'),
                      ),
                    ],
                  ),
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
        const Text('Kundvagn'),
        SizedBox(height: 600, child: CartView()),
        ElevatedButton(
          onPressed: () => iMat.placeOrder(),
          child: const Text('Köp!'),
        ),
      ],
    );
  }

  Container _leftPanel(ImatDataHandler iMat) {
    return Container(
      width: 300,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () => iMat.selectAllProducts(),
              child: const Text('Visa allt'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () => iMat.selectFavorites(),
              child: const Text('Favoriter'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
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
              child: const Text('Urval'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () => iMat.selectSelection(
                iMat.findProductsByCategory(ProductCategory.CABBAGE),
              ),
              child: const Text('Grönsaker'),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 132,
            child: ElevatedButton(
              onPressed: () => iMat.selectSelection(iMat.findProducts('mj')),
              child: const Text('Söktest'),
            ),
          ),
        ],
      ),
    );
  }

  Row _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {}, 
          child: const Text('iMat')
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => _showHistory(context),
              child: const Text('Köphistorik'),
            ),
            ElevatedButton(
              onPressed: () => _showAccount(context),
              child: const Text('Användare'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _centerStage(BuildContext context, List<Product> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.85,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductTile(products[index], compact: true);
      },
    );
  }

  void _showAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountView()),
    );
  }

  void _showHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryView()),
    );
  }
}