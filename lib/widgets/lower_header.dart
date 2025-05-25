import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LowerHeader extends StatelessWidget {
  final VoidCallback onCategoriesPressed;
  final VoidCallback onFavoritesPressed;

  const LowerHeader({
    Key? key,
    required this.onCategoriesPressed,
    required this.onFavoritesPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE4FEDD),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Kategorier', 
              style: GoogleFonts.reemKufi(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TextButton(
                onPressed: onFavoritesPressed,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF3D5430),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Favoriter',
                  style: GoogleFonts.reemKufi(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: 8),
          ),
        ],
      ),
    );
  }
}