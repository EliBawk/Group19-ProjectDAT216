import 'package:api_test/pages/main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onAccountPressed;
  final VoidCallback onCartPressed;
  
  const CustomHeader({
    Key? key,
    required this.onAccountPressed,
    required this.onCartPressed, required Null Function() onCategoriesPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF91C184),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainView()),
                  );
                }, // Changed to use onCartPressed
              child: Image.asset(
                "assets/images/iMat.png",
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              )
            )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 7),
                      hintText: 'Sök...',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Color(0xFF3D5430)),
                    ),
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 11),
                  child: TextButton(
                    onPressed: onAccountPressed,
                    style: TextButton.styleFrom(
                      fixedSize: const Size(175, 50),
                      backgroundColor: const Color(0xFF3D5430),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Kundservice',
                      style: GoogleFonts.reemKufi(
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 11),
                    child: TextButton(
                      onPressed: onAccountPressed,
                      style: TextButton.styleFrom(
                        fixedSize: const Size(125, 50),
                        backgroundColor: const Color(0xFF3D5430),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Konto',
                        style: GoogleFonts.reemKufi(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}