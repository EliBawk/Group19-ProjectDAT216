import 'package:api_test/model/imat/credit_card.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Simple widget to edit card information.
// It's probably better to use Form
class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  late final TextEditingController _typeController;
  late final TextEditingController _nameController;
  late final TextEditingController _monthController;
  late final TextEditingController _yearController;
  late final TextEditingController _numberController;
  late final TextEditingController _codeController;

  @override
  void initState() {
    super.initState();

    var iMat = Provider.of<ImatDataHandler>(context, listen: false);
    CreditCard card = iMat.getCreditCard();

    _typeController = TextEditingController(text: card.cardType);
    _nameController = TextEditingController(text: card.holdersName);
    _monthController = TextEditingController(text: '${card.validMonth}');
    _yearController = TextEditingController(text: '${card.validYear}');
    _numberController = TextEditingController(text: card.cardNumber);
    _codeController = TextEditingController(text: '${card.verificationCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _typeController,
          decoration: const InputDecoration(labelText: 'Kortnummer'),
        ),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Namn'),
        ),
        TextField(
          controller: _monthController,
          decoration: const InputDecoration(labelText: 'Giltigt månad (1-12)'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _yearController,
          decoration: const InputDecoration(labelText: 'Giltigt år'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _codeController,
          decoration: const InputDecoration(labelText: 'CVV-kod'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24), // Mer utrymme ovanför knappen
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: _saveCard,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3D5430), // Mörkgrön färg
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Spara'),
            ),
          ],
        ),
      ],
    );
  }

  void _saveCard() {
    var iMat = Provider.of<ImatDataHandler>(context, listen: false);
    CreditCard card = iMat.getCreditCard();

    card.cardType = _typeController.text;
    card.holdersName = _nameController.text;
    card.validMonth = int.tryParse(_monthController.text) ?? 0;
    card.validYear = int.tryParse(_yearController.text) ?? 0;
    card.cardNumber = _numberController.text;
    card.verificationCode = int.tryParse(_codeController.text) ?? 0;

    // Triggerar uppdatering till servern
    iMat.setCreditCard(card);
  }
}
