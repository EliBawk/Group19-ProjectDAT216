import 'package:api_test/app_theme.dart';
import 'package:api_test/model/imat/order.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/pages/account_view.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  Order? _selectedOrder;

  @override
  Widget build(BuildContext context) {
    final iMat = Provider.of<ImatDataHandler>(context, listen: false);
    final orders = iMat.orders;

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

          // Ljusgrön box med "Fortsätt handla"-knapp och "Orderhistorik"
          Container(
            width: double.infinity,
            color: const Color(0xFFE4FEDD), // ljusgrön
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 0), // bottenpadding borttagen
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const AccountView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3D5430),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back),
                  label: Text(
                    'Fortsätt handla',
                    style: GoogleFonts.reemKufi(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Orderhistorik',
                  style: GoogleFonts.reemKufi(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Orders-listan, mellangrön box
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color(0xFF91C184), // mellangrön färg
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: _ordersList(orders),
                        ),

                        const SizedBox(width: 20),

                        // Orderdetaljer
                        Expanded(
                          child: _orderDetails(_selectedOrder),
                        ),
                      ],
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

  Widget _ordersList(List<Order> orders) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: const EdgeInsets.only(
            left: 8,
            right: 8,
            bottom: 8,
            top: 8,  // Top margin även på första kortet
          ),
          elevation: 2,
          child: ListTile(
            onTap: () => _selectOrder(order),
            title: Text(
              'Order ${order.orderNumber}',
              style: GoogleFonts.reemKufi(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              _formatDateTime(order.date),
              style: GoogleFonts.reemKufi(fontSize: 14),
            ),
            trailing: Text(
              '${order.getTotal().toStringAsFixed(2)} kr',
              style: GoogleFonts.reemKufi(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  void _selectOrder(Order order) {
    setState(() {
      _selectedOrder = order;
    });
  }

  String _formatDateTime(DateTime dt) {
    final formatter = DateFormat('yyyy-MM-dd, HH:mm');
    return formatter.format(dt);
  }

  Widget _orderDetails(Order? order) {
    if (order == null) {
      return Center(
        child: Text(
          'Välj en order för att se detaljer',
          style: GoogleFonts.reemKufi(fontSize: 18),
        ),
      );
    }

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ${order.orderNumber}',
              style: GoogleFonts.reemKufi(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _formatDateTime(order.date),
              style: GoogleFonts.reemKufi(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            Text(
              'Produkter:',
              style: GoogleFonts.reemKufi(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final item in order.items)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                item.product.name,
                                style: GoogleFonts.reemKufi(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${item.amount} st',
                                style: GoogleFonts.reemKufi(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${(item.product.price * item.amount).toStringAsFixed(2)} kr',
                                style: GoogleFonts.reemKufi(fontSize: 16),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Totalt:',
                  style: GoogleFonts.reemKufi(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${order.getTotal().toStringAsFixed(2)} kr',
                  style: GoogleFonts.reemKufi(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Varav moms:',
                  style: GoogleFonts.reemKufi(fontSize: 16),
                ),
                Text(
                  '${(order.getTotal() * 0.25).toStringAsFixed(2)} kr',
                  style: GoogleFonts.reemKufi(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
