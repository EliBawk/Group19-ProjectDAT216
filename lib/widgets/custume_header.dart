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
                      child: Image.asset(
                        "assets/images/iMat.png",
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ))),
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
                        boxShadow: const [
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
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xFF3D5430)),
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
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8.0, top: 11),
                      child: TextButton.icon(
                        onPressed: onAccountPressed,
                        icon: const Icon(Icons.support_agent,
                            size: 20, color: Colors.white),
                        label: Text(
                          'Kundservice',
                          style: GoogleFonts.reemKufi(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          fixedSize: const Size(175, 50),
                          backgroundColor: const Color(0xFF3D5430),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 11),
                        child: TextButton.icon(
                          onPressed: onAccountPressed,
                          icon: const Icon(Icons.account_circle,
                              size: 20, color: Colors.white),
                          label: Text(
                            'Konto',
                            style: GoogleFonts.reemKufi(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            fixedSize: const Size(125, 50),
                            backgroundColor: const Color(0xFF3D5430),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HoverableCategoryText(onPressed: onCategoriesPressed),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3D5430),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton.icon(
                  onPressed: onFavoritesPressed,
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  label: Text(
                    'Favoriter',
                    style: GoogleFonts.reemKufi(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

class HoverableCategoryText extends StatefulWidget {
  final VoidCallback onPressed;
  const HoverableCategoryText({Key? key, required this.onPressed})
      : super(key: key);

  @override
  _HoverableCategoryTextState createState() => _HoverableCategoryTextState();
}

class _HoverableCategoryTextState extends State<HoverableCategoryText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _isHovering ? Colors.black.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Kategorier',
            style: GoogleFonts.reemKufi(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
