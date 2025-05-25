import 'package:api_test/widgets/custume_header.dart';
import 'package:flutter/material.dart';
import 'package:api_test/pages/main_view.dart';
import 'package:google_fonts/google_fonts.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              onAccountPressed: () {},
              onCartPressed: () {},
              onCategoriesPressed: () {
                Navigator.pop(context);
              },
              onFavoritesPressed: () {},
            ),

            const SizedBox(height: 20),

            // Övre rektangeln
            Container(
              height: 80,
              width: double.infinity,
              color: const Color(0xFFE4FEDD),
              alignment: Alignment.center,
              child: Text(
                'Välkommen Gördis',
                style: GoogleFonts.reemKufi(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Knappen
            SizedBox(
              width: 467,
              height: 139,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D5430),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainView()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Börja handla!',
                      style: GoogleFonts.reemKufi(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_forward, color: Colors.white, size: 26),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Undre rektangeln
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFE4FEDD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
