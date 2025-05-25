import 'package:api_test/app_theme.dart';
import 'package:api_test/pages/history_view.dart';
import 'package:api_test/pages/main_view.dart';
import 'package:api_test/widgets/card_details.dart';
import 'package:api_test/widgets/cart_view.dart';
import 'package:api_test/widgets/customer_details.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: 'Reem Kufi',
            color: Colors.black87,
          ),
          child: Column(
            children: [
              CustomHeader(
                onAccountPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountView()),
                  );
                },
                onCartPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const CartView()),
                  );
                },
                onCategoriesPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainView()),
                  );
                },
              ),

              // Promo bar visas här
              _promoBar(context),

              // Expanded med scroll om innehållet blir stort
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Box 1: Leveransuppgifter
                      Expanded(
                        child: Container(
                          height: 450,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE4FEDD),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Leveransuppgifter',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 12),
                              Expanded(child: CustomerDetails()),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Box 2: Betalningsuppgifter
                      Expanded(
                        child: Container(
                          height: 450,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE4FEDD),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Betalningsuppgifter',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 12),
                              Expanded(child: CardDetails()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _promoBar(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE4FEDD),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(blurRadius: 4, offset: Offset(0, 2), color: Colors.black26),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                // Exempel på action, kan bytas ut
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryView()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF3D5430),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Köphistorik',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 16),
          
        ],
      ),
    );
  }
}