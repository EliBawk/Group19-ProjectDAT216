import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onAccountPressed;
  final VoidCallback onCartPressed;
  final VoidCallback onCategoriesPressed;
   final VoidCallback onFavoritesPressed;

  const CustomHeader({
    Key? key,
    required this.onAccountPressed,
    required this.onCartPressed,
    required this.onCategoriesPressed,
    required this.onFavoritesPressed,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Mörkgrön header med iMat, sökfält och knappar
        Container(
          color: const Color(0xFF91C184),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Stack(
            children: [
               Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: onCategoriesPressed,
                  child: Image.asset("assets/images/iMat.png",
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,)
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
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 7),
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
                       padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 11),
                       child: TextButton(
                          onPressed: onAccountPressed,
                          style: TextButton.styleFrom(
                            fixedSize: Size(175, 50),
                            
                            backgroundColor: const Color(0xFF3D5430),
                            foregroundColor: Colors.white,
                            
                            shape: RoundedRectangleBorder(
                              
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child:  Text(
                            'Kundservice',
                            style: GoogleFonts.reemKufi(
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          ),
                        ),
                     ),
                    Container(
                    
                      
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 11),
                        child: TextButton(
                          onPressed: onAccountPressed,
                          style: TextButton.styleFrom(
                            fixedSize: Size(125, 50),
                            
                            backgroundColor: const Color(0xFF3D5430),
                            foregroundColor: Colors.white,
                            
                            shape: RoundedRectangleBorder(
                              
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child:  Text(
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
        ),

        // Ljusgrön rad under header
        Container(
          color: const Color(0xFFE4FEDD),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(  
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                      'Kategorier', 
                      style: GoogleFonts.reemKufi(fontSize: 30,
                      fontWeight: FontWeight.w700)
                      ),
                                        
                    ),
                
              ),
               Padding(
                 padding: const EdgeInsets.all(8),
                 child: Container(
                  decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                            
                            ),
                          ],
                        ),
                   child: 
                   
                     TextButton(
                         onPressed: onFavoritesPressed,
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF3D5430),
                          foregroundColor: Colors.white,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child:  Text(
                          'Favoriter',
                          style: GoogleFonts.reemKufi(fontSize: 20,
                          fontWeight: FontWeight.bold)
                          ),
                      ),
                   ),
               ),
               
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                
              ),
              const Spacer(),
              Container(
                      margin: const EdgeInsets.only(right: 8),
                      
                      
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
