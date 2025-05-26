import 'package:api_test/model/imat/customer.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Simple widget to edit customer information.
class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key});

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _mobileNumberController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _postCodeController;
  late final TextEditingController _postAddressController;
  late final ImatDataHandler _imatDataHandler;

  @override
  void initState() {
    super.initState();

    _imatDataHandler = Provider.of<ImatDataHandler>(context, listen: false);
    Customer customer = _imatDataHandler.getCustomer();

    _firstNameController = TextEditingController(text: customer.firstName);
    _lastNameController = TextEditingController(text: customer.lastName);
    _mobileNumberController = TextEditingController(text: customer.mobilePhoneNumber);
    _emailController = TextEditingController(text: customer.email);
    _addressController = TextEditingController(text: customer.address);
    _postCodeController = TextEditingController(text: customer.postCode);
    _postAddressController = TextEditingController(text: customer.postAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _firstNameController,
          decoration: const InputDecoration(labelText: 'Förnamn'),
        ),
        TextField(
          controller: _lastNameController,
          decoration: const InputDecoration(labelText: 'Efternamn'),
        ),
        TextField(
          controller: _mobileNumberController,
          decoration: const InputDecoration(labelText: 'Mobilnummer'),
          keyboardType: TextInputType.phone,
        ),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'E-post'),
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          controller: _addressController,
          decoration: const InputDecoration(labelText: 'Adress'),
        ),
        TextField(
          
          controller: _postCodeController,
          decoration: const InputDecoration(labelText: 'Postnummer'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _postAddressController,
          decoration: const InputDecoration(labelText: 'Ort'),
        ),
        const SizedBox(height: 24), // Lite mer utrymme ovanför knappen
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: _saveCustomer,
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

  void _saveCustomer() {
    Customer customer = _imatDataHandler.getCustomer();

    customer.firstName = _firstNameController.text;
    customer.lastName = _lastNameController.text;
    customer.mobilePhoneNumber = _mobileNumberController.text;
    customer.email = _emailController.text;
    customer.address = _addressController.text;
    customer.postCode = _postCodeController.text;
    customer.postAddress = _postAddressController.text;

    // Triggera uppdatering till servern
    _imatDataHandler.setCustomer(customer);
  }
}
