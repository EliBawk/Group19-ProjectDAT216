// product_view.dart

import 'package:flutter/material.dart';
import 'package:api_test/widgets/custume_header.dart';

class ProductView extends StatelessWidget {
  final String category;

  const ProductView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              onAccountPressed: () {
                Navigator.pushNamed(context, '/account');
              },
              onCartPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              onCategoriesPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Produkter i kategorin: $category',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Här kommer produktkort för "$category"',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
