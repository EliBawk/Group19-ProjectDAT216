import 'package:api_test/widgets/custume_header.dart';
import 'package:flutter/material.dart';
import 'package:api_test/pages/main_view.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

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
              onFavoritesPressed: () {},
            ),

            const SizedBox(height: 40),

            Container(
              height: 80,
              width: double.infinity,
              color: const Color(0xFFE4FEDD),
              alignment: Alignment.center,
              child: const Text(
                'Välkommen Gördis',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 467,
              height: 139,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D5430),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // större rundning
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainView()),
                  );
                },
                child: const Text(
                  'Börja handla!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
