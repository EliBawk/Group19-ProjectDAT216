// ignore_for_file: deprecated_member_use

import 'package:api_test/model/imat/credit_card.dart';
import 'package:api_test/model/imat/customer.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/pages/delivery_view.dart';
import 'package:api_test/widgets/card_details.dart';
import 'package:api_test/widgets/customer_details.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CredentialsView extends StatelessWidget {
  const CredentialsView({super.key});

  @override
  Widget build(BuildContext context) {
    final iMat = Provider.of<ImatDataHandler>(context);
    final customer = iMat.getCustomer();
    final card = iMat.getCreditCard();

    // Debug-utskrifter för att kontrollera värdena
    debugPrint('Customer first name: ${customer.firstName}');
    debugPrint('Card number: ${card.cardNumber}');

    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            onAccountPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountView()),
              );
            },
            onCartPressed: () {}, 
            onCategoriesPressed: () {},
          ),
          
          
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: const Color(0xFFE4FEDD),
             // Green background
            child: Stack(
              children: [
                Align(alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      
                          'Kontrollera att dina personuppgifter stämmer',
                          style: GoogleFonts.reemKufi(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                ),
                    Expanded(child: Container()),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    
                    decoration: BoxDecoration(
                      color: const Color(0xFF3D5430),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Current step with white background
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 6.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Personuppgifter',
                              style: GoogleFonts.reemKufi(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF3D5430),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          // Next steps
                          Text(
                            'Leverans',
                            style: GoogleFonts.reemKufi(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          
                          
                          const SizedBox(width: 8),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Kvitto',
                            style: GoogleFonts.reemKufi(
                              fontSize: 16,
                                  
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Kundinformation
                  _buildCustomerCard(context, customer),
                  const SizedBox(height: 20),

                  // Betalningsinformation
                  _buildPaymentCard(context, card),
                ],
              ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountView()),
                  );
                },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3D5430),
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Redigera personuppgifter',
                        style: GoogleFonts.reemKufi(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeliveryView()),
                  );
                },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3D5430),
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Leveransalternativ',
                        style: GoogleFonts.reemKufi(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerCard(BuildContext context, Customer customer) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personuppgifter',
                  style: GoogleFonts.reemKufi(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            _buildDetailItem('Förnamn', customer.firstName),
            _buildDetailItem('Efternamn', customer.lastName),
            _buildDetailItem('Mobilnummer', customer.mobilePhoneNumber),
            _buildDetailItem('E-post', customer.email),
            _buildDetailItem('Adress', customer.address),
            _buildDetailItem('Postnummer', customer.postCode),
            _buildDetailItem('Ort', customer.postAddress),
          ],
        ),
      ),
    );
  }
  

  Widget _buildPaymentCard(BuildContext context, CreditCard card) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Betalningsinformation',
                  style: GoogleFonts.reemKufi(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
              ],
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            _buildDetailItem('Korttyp', card.cardType),
            _buildDetailItem('Korthållare', card.holdersName),
            _buildDetailItem('Kortnummer', _formatCardNumber(card.cardNumber)),
            _buildDetailItem('Giltigt till', _formatExpiryDate(card.validMonth, card.validYear)),
            _buildDetailItem('CVV-kod', card.verificationCode?.toString() ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String? value) {
    final displayValue = value?.trim() ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: GoogleFonts.reemKufi(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              displayValue.isNotEmpty ? displayValue : 'Ej angivet',
              style: GoogleFonts.reemKufi(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
  
  

  String _formatCardNumber(String? number) {
    if (number == null || number.isEmpty) return '';
    if (number.length < 4) return number;
    final lastFour = number.substring(number.length - 4);
    return '•••• •••• •••• $lastFour';
  }

  String _formatExpiryDate(int? month, int? year) {
    if (month == null || year == null) return '';
    return '${month.toString().padLeft(2, '0')}/${year.toString().substring(2)}';
  }

  void _navigateToEditCustomer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Redigera personuppgifter')),
        body: const CustomerDetails(),
      )),
    );
  }

  void _navigateToEditCard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Redigera kortuppgifter')),
        body: const CardDetails(),
      )),
    );
  }
}