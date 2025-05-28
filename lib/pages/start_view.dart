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
            ),

            const SizedBox(height: 20),

            // Övre rektangeln
            Container(
              height: 80,
              width: double.infinity,
              color: const Color(0xFFE4FEDD),
              alignment: Alignment.center,
              child: Text(
                'Välkommen till iMat!',
                style: GoogleFonts.reemKufi(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Knappen med skugga
            Container(
              width: 467,
              height: 139,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
                borderRadius: BorderRadius.circular(80),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D5430),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  elevation: 0, // Elevation sätts till 0 eftersom vi använder BoxShadow istället
                  shadowColor: Colors.transparent,
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
