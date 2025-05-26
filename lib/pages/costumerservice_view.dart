import 'package:api_test/widgets/custume_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          // Headern högst upp
          CustomHeader(
            onAccountPressed: () {},
            onCartPressed: () {},
            onCategoriesPressed: () {},
          ),

          // Ljusgrön rektangel under headern
          Container(
            width: double.infinity,
            color: const Color(0xFFE4FEDD),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'Kundservice',
              style: GoogleFonts.reemKufi(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // Scrollbar för hela sidan
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _questionWithAnswer(
                    "Hur returnerar jag en vara?",
                    "Du har 14 dagars ångerrätt från det att du mottagit varan. Kontakta oss via mail eller telefon så hjälper vi dig att skapa en retursedel. Glöm inte att spara kvittot!",
                  ),
                  _questionWithAnswer(
                    "Hur fungerar leveransen?",
                    "Vi erbjuder hemleverans samt utlämning via paketombud. Normalt tar leveransen 1–3 arbetsdagar. Du får ett spårningsnummer så snart paketet lämnat vårt lager.",
                  ),
                  _questionWithAnswer(
                    "Hur uppdaterar jag mina kontouppgifter?",
                    "Gå till 'Konto' uppe till höger och välj 'Inställningar'. Där kan du ändra dina adressuppgifter, lösenord och kontaktuppgifter enkelt och säkert.",
                  ),
                  _questionWithAnswer(
                    "Vilka betalningsmetoder accepteras?",
                    "Vi accepterar kortbetalningar (Visa, Mastercard), Swish samt faktura via Klarna. Alla betalningar är säkrade med högsta krypteringsstandard.",
                  ),
                  _questionWithAnswer(
                    "Hur kontaktar jag kundtjänst?",
                    "Du kan skriva direkt i formuläret nedan, eller ringa oss. Vi finns här för dig varje vardag mellan 08–17. ❤️",
                  ),

                  const SizedBox(height: 30),

                  // Kontakta oss via mail
                  Text(
                    'Kontakta oss via mail:',
                    style: GoogleFonts.reemKufi(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    controller: _controller,
                    maxLines: 4,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE4FEDD),
                      hintText: 'Skriv ditt meddelande här...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Meddelande skickat!")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D5430),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Skicka',
                      style: GoogleFonts.reemKufi(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '📞 Ring oss: 010-123 45 67',
                    style: GoogleFonts.reemKufi(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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

  // Textbaserad FAQ-fråga + svar
  Widget _questionWithAnswer(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.reemKufi(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: GoogleFonts.reemKufi(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
