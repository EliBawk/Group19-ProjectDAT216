import 'package:api_test/pages/main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:provider/provider.dart';
import 'package:api_test/model/imat_data_handler.dart';

class RecieptView extends StatelessWidget {
  const RecieptView({super.key});

  @override
  Widget build(BuildContext context) {
    final customerEmail = context.read<ImatDataHandler>().getCustomer().email;

    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            onAccountPressed: () {},
            onCartPressed: () {},
            onCategoriesPressed: () {},
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    color: const Color(0xFFDFF7D9),
                    child: Text(
                      'Kvitto',
                      style: GoogleFonts.reemKufi(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // svart färg
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Stegnavigering
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3D5430),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _stepLabel('Personuppgifter'),
                        const Icon(Icons.chevron_right, color: Colors.white),
                        _stepLabel('Leverans'),
                        const Icon(Icons.chevron_right, color: Colors.white),
                        _stepLabel('Betalning'),
                        const Icon(Icons.chevron_right, color: Colors.white),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Kvitto',
                            style: GoogleFonts.reemKufi(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF3D5430),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    color: const Color(0xFFDFF7D9),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Center(
                      child: Text(
                        'Tack för att du handlar hos iMAT!',
                        style: GoogleFonts.reemKufi(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF3D5430),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      Text(
                        'Orderbekräftelse',
                        style: GoogleFonts.reemKufi(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.reemKufi(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Ordernummer: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(text: '1234567'), // Du kan göra detta dynamiskt senare
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Din beställning är nu mottagen och kommer behandlas inom kort.',
                        style: GoogleFonts.reemKufi(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'En bekräftelse med kvitto har skickats till $customerEmail.',
                        style: GoogleFonts.reemKufi(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Du kommer att få ett SMS när varorna är påväg.',
                        style: GoogleFonts.reemKufi(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Image.asset(
                   "assets/images/iMat.png", // <-- ändra till din logotypväg
                    height: 80,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D5430),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainView()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Till startsidan',
                      style: GoogleFonts.reemKufi(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.reemKufi(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
