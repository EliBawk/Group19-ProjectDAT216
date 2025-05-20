import 'package:flutter/material.dart';
import 'package:api_test/widgets/custume_header.dart'; // din header

class ProductsView extends StatelessWidget {
  final String category;

  const ProductsView({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              onAccountPressed: () {
                // navigering till account view
              },
              onCartPressed: () {
                // navigering till cart view
              },
              onCategoriesPressed: () {
                Navigator.pop(context); // går tillbaka till MainView
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Produkter i kategori: $category',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            // Här lägger du listan med produkter, t.ex. GridView eller ListView
            Expanded(
              child: Center(
                child: Text('Lista över produkter kommer här'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
