import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/pages/costumerservice_view.dart';
import 'package:api_test/pages/main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onAccountPressed;
  final VoidCallback onCartPressed;
  final VoidCallback onCategoriesPressed;

  const CustomHeader({
    Key? key,
    required this.onAccountPressed,
    required this.onCartPressed,
    required this.onCategoriesPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF91C184),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16), // 16 px från vänster & höger
      child: Stack(
        children: [
          // Vänster: logotyp
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainView()),
                );
              },
              child: Image.asset(
                "assets/images/iMat.png",
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Mitten: sökfält
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
              color: Colors.black.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 7),
            hintText: 'Sök...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Color(0xFF3D5430)),
          ),
          style: const TextStyle(color: Colors.black87),
          onChanged: (value) {
            final iMat = Provider.of<ImatDataHandler>(context, listen: false);
            iMat.selectSelection(iMat.findProducts(value));
          },
        ),
      ),
    ),
  ),
),

          // Höger: knappar med padding så konto-knappen ligger 16 px från höger
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16), // Viktigt! 16 px från högerkant
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Kundservice-knapp med ikon och skugga
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomerServiceView(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size(175, 50),
                          backgroundColor: const Color(0xFF3D5430),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.support_agent, color: Colors.white, size: 26),
                            const SizedBox(width: 8),
                            Text(
                              'Kundservice',
                              style: GoogleFonts.reemKufi(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Konto-knapp med ikon och skugga
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 11),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(
                        onPressed:() {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AccountView()),
                      );
            

                          
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size(125, 50),
                          backgroundColor: const Color(0xFF3D5430),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.person, color: Colors.white, size: 26),
                            const SizedBox(width: 8),
                            Text(
                              'Konto',
                              style: GoogleFonts.reemKufi(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
