import 'package:api_test/app_theme.dart';
import 'package:api_test/model/imat/product.dart';
import 'package:api_test/model/imat/util/functions.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/pages/checkout_view.dart';
import 'package:api_test/pages/history_view.dart';
import 'package:api_test/pages/product_view.dart';
import 'package:api_test/widgets/cart_view.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:api_test/widgets/lower_header.dart';
import 'package:api_test/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            },  ),
            LowerHeader(
      
      onFavoritesPressed: () => iMat.selectFavorites(), onCategoriesPressed: () {  },
    ),

          
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _leftPanel(context, iMat),
                SizedBox(
                  width: 966,
                  //height: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0, right: 10.0),
                    child: _centerStage(context, products),
                  ),
                ),
                SizedBox(
                  
                  width: 300,
                  //color: Colors.blueGrey,
                  child: _shoppingCart(context, iMat),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _shoppingCart(BuildContext context,ImatDataHandler iMat) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 50),
      child: Column(
        children: [
          Text('Kundvagn',style: GoogleFonts.reemKufi(fontSize: 20, fontWeight: FontWeight.w700 ), ),
          SizedBox(height: 500, child: CartView()),
          FilledButton(
            
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => CheckoutView()),
            );
          },
            
            child: Text('Till betalning!',
            style: GoogleFonts.reemKufi(fontSize: 20,
            fontWeight: FontWeight.bold)),
            
          ),
        ],
      ),
    );
  }

  Container _leftPanel(BuildContext context,ImatDataHandler iMat) {
    return Container(
      width: 200,
      color: const Color(0xFF91C184),
      child: SingleChildScrollView(
        child: 
      Column(
        children: [
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                iMat.selectAllProducts();
              },
              child: Text('Visa allt',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          
          SizedBox(
            width: 160,
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
              child: Text('Kampanj',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
              
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
SizedBox(
  width: 160,
  child: ElevatedButton(
    onPressed: () {
      var selected = [
        ...iMat.findProductsByCategory(ProductCategory.FRUIT),
        ...iMat.findProductsByCategory(ProductCategory.VEGETABLE_FRUIT),
        ...iMat.findProductsByCategory(ProductCategory.EXOTIC_FRUIT),
        ...iMat.findProductsByCategory(ProductCategory.CITRUS_FRUIT),
        ...iMat.findProductsByCategory(ProductCategory.MELONS),
        ...iMat.findProductsByCategory(ProductCategory.ROOT_VEGETABLE),
        ...iMat.findProductsByCategory(ProductCategory.CABBAGE),
        ...iMat.findProductsByCategory(ProductCategory.BERRY)
      ];
      iMat.selectSelection(selected);
    },
    child: Text('Frukt & Grönt', style: GoogleFonts.reemKufi()),
  ),
),
SizedBox(height: AppTheme.paddingSmall),
SizedBox(
  width: 160,
  child: ElevatedButton(
    onPressed: () {
      var selected = [
        ...iMat.findProductsByCategory(ProductCategory.POTATO_RICE),
        ...iMat.findProductsByCategory(ProductCategory.PASTA),
      ];
      iMat.selectSelection(selected);
    },
    child: Text('Kolhydrater', style: GoogleFonts.reemKufi()),
  ),
),

SizedBox(height: AppTheme.paddingSmall),
SizedBox(
  width: 160,
  child: ElevatedButton(
    onPressed: () {
      var selected = [
        ...iMat.findProductsByCategory(ProductCategory.FLOUR_SUGAR_SALT),
        ...iMat.findProductsByCategory(ProductCategory.POD),
        
      ];
      iMat.selectSelection(selected);
    },
    child: Text('Torrvaror', style: GoogleFonts.reemKufi()),
  ),
),

SizedBox(height: AppTheme.paddingSmall),

          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.CABBAGE),
                );
              },
              child: Text(
                'Grönsaker',
                style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.POD),
                );
              },
              child: Text('Balgväxter',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.BREAD),
                );
              },
              child: Text('Bröd',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),

          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.CITRUS_FRUIT),
                );
              },
              child: Text('Citrusfrukter',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.HOT_DRINKS),
                );
              },
              child: Text('Kaffe/te',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),

        
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.COLD_DRINKS),
                );
              },
              child: Text('Kalla drycker',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),SizedBox(height: AppTheme.paddingSmall),
          

          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.EXOTIC_FRUIT),
                );
              },
              child: Text('Exotiska frukter',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.FISH),
                );
              },
              child: Text('Fisk',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),


          
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.VEGETABLE_FRUIT),
                );
              },
              child: Text('Fruktgrönsaker',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.MEAT),
                );
              },
              child: Text('Kött',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),


          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.DAIRIES),
                );
              },
              child: Text('Mejeriprodukter',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),

          
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.MELONS),
                );
              },
              child: Text('Meloner',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Söktest');
                iMat.selectSelection(iMat.findProducts('mj'));
              },
              child: Text('Söktest',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
        
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.FLOUR_SUGAR_SALT),
                );
              },
              child: Text('Mjöl/socker/salt',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.NUTS_AND_SEEDS),
                );
              },
              child: Text('Nötter och frön',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),

        
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.PASTA),
                );
              },
              child: Text('Pasta',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.POTATO_RICE),
                );
              },
              child: Text('Potatis/ris',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.ROOT_VEGETABLE),
                );
              },
              child: Text('Rotfrukter',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.FRUIT),
                );
              },
              child: Text('Frukt',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 190,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.SWEET),
                );
              },
              child: Text('Sötsaker',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: AppTheme.paddingSmall),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                //print('Frukt');
                iMat.selectSelection(
                  iMat.findProductsByCategory(ProductCategory.HERB),
                );
              },
              child: Text('Örter',style: GoogleFonts.reemKufi(fontSize: 18,
                fontWeight: FontWeight.bold),),
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
      crossAxisSpacing: 10,  // Reduced spacing
      mainAxisSpacing: 10,  // Reduced spacing
      childAspectRatio: 0.75,  // More rectangular shape to fit content
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
