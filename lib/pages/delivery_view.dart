import 'package:api_test/pages/credentials_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:api_test/model/imat_data_handler.dart';
import 'package:api_test/model/imat/customer.dart';
import 'package:api_test/widgets/custume_header.dart';
import 'package:intl/date_symbol_data_local.dart'; // För svenska datum
import 'package:api_test/pages/main_view.dart';



class DeliveryView extends StatefulWidget {
  const DeliveryView({super.key});

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('sv_SE', null);
  }
  DateTime _currentDisplayMonth;
  DateTime? _selectedDate;
  final List<String> _deliveryTimes = [
    '08:00-10:00',
    '10:00-12:00',
    '12:00-14:00',
    '14:00-16:00',
    '16:00-18:00',
    '18:00-20:00',
  ];
  String? _selectedTime;

  _DeliveryViewState() : _currentDisplayMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final iMat = Provider.of<ImatDataHandler>(context);
    final customer = iMat.getCustomer();

    return Scaffold(
      body: Column(
        children: [
          CustomHeader(
            onAccountPressed: () {},
            onCartPressed: () {},
            onCategoriesPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
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
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),),
                                
                              child: TextButton(
                                onPressed: () {Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CredentialsView()),
                              );},
                                child: Text(
                                  'Personuppgifter',
                                  style: GoogleFonts.reemKufi(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF3D5430),
                                  ),
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
                                'Leverans',
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
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kalender
                SizedBox(
                  width: 400,
                  height: 400, // Höjd ökad för månadsnavigering
                  child: Column(
                    children: [
                      // Månadsnavigering
                      _buildMonthNavigation(),
                      const SizedBox(height: 10),
                      Expanded(child: _buildCalendarGrid()),
                    ],
                  ),
                ),
                
                // Leveransuppgifter
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      SizedBox(
                      
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Leveransuppgifter',
                                style: GoogleFonts.reemKufi(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(thickness: 2),
                              const SizedBox(height: 10),
                              _buildDetailItem('Namn', '${customer.firstName} ${customer.lastName}'),
                              _buildDetailItem('Telefon', customer.mobilePhoneNumber),
                              _buildDetailItem('E-post', customer.email),
                              _buildDetailItem('Adress', customer.address),
                              _buildDetailItem('Postnummer', customer.postCode),
                              _buildDetailItem('Ort', customer.postAddress),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                
                
                // Tidsluckor
                SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Välj tidpunkt',
                        style: GoogleFonts.reemKufi(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF3D5430),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildTimeSlots(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            width: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Container(
                decoration: BoxDecoration(
                        color: const Color(0xFF3D5430),
                        borderRadius: BorderRadius.circular(40),
                      ),
                child: TextButton(
                  onPressed: () {Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CredentialsView()),
                              );},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                        'Tillbaka till personuppgifter',
                        style: GoogleFonts.reemKufi(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color:  Colors.white,
                                    ),
                                  ),
                ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                        color: const Color(0xFF3D5430),
                        borderRadius: BorderRadius.circular(40),
                      ),
                child: TextButton(
                  
                      onPressed: () {
                        iMat.placeOrder();
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainView()),
                  ); 
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                        'Bekräfta köp!',
                        style: GoogleFonts.reemKufi(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color:  Colors.white,
                                    ),
                                  ),
                ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // Ny metod för månadsnavigering
  Widget _buildMonthNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            setState(() {
              _currentDisplayMonth = DateTime(
                _currentDisplayMonth.year,
                _currentDisplayMonth.month - 1,
                1);
            });
          },
        ),
        Text(
        DateFormat('MMMM', 'sv_SE').format(_currentDisplayMonth).toUpperCase(),
            style:GoogleFonts.reemKufi(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3D5430),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {
            setState(() {
              _currentDisplayMonth = DateTime(
                _currentDisplayMonth.year,
                _currentDisplayMonth.month + 1,
                1);
            });
          },
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(_currentDisplayMonth.year, _currentDisplayMonth.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(_currentDisplayMonth.year, _currentDisplayMonth.month);
    final startingWeekday = firstDayOfMonth.weekday;

    List<TableRow> rows = [];

    // Lägg till veckodagar
    rows.add(
      TableRow(
        children: ['Mån', 'Tis', 'Ons', 'Tor', 'Fre', 'Lör', 'Sön']
            .map((day) => Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      day,
                      style: GoogleFonts.reemKufi(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );

    List<Widget> currentWeek = [];
    int dayCounter = 1;

    // Lägg till tomma celler för dagar i förra månaden
    for (int i = 1; i < startingWeekday; i++) {
      currentWeek.add(Container());
    }

    while (dayCounter <= daysInMonth) {
      final currentDate = DateTime(_currentDisplayMonth.year, _currentDisplayMonth.month, dayCounter);
      final isPastDate = currentDate.isBefore(DateTime.now().subtract(const Duration(days: 1)));
      final isSelected = _selectedDate != null &&
          _selectedDate!.day == dayCounter &&
          _selectedDate!.month == _currentDisplayMonth.month;

      currentWeek.add(
        GestureDetector(
          onTap: isPastDate
              ? null
              : () {
                  setState(() {
                    _selectedDate = currentDate;
                    _selectedTime = null;
                  });
                },
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF3D5430)
                  : isPastDate
                      ? Colors.grey[400]
                      : const Color(0xFFC8E6C9),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              '$dayCounter',
              style: GoogleFonts.reemKufi(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      );

      dayCounter++;

      if (currentWeek.length == 7 || dayCounter > daysInMonth) {
        while (currentWeek.length < 7) {
          currentWeek.add(Container());
        }
        rows.add(TableRow(children: currentWeek));
        currentWeek = [];
      }
    }

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
        4: FlexColumnWidth(1),
        5: FlexColumnWidth(1),
        6: FlexColumnWidth(1),
      },
      children: rows,
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

  Widget _buildTimeSlots() {
    return Column(
      children: _deliveryTimes.map((time) {
        final isSelected = _selectedTime == time;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedTime = isSelected ? null : time;
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected 
                    ? const Color(0xFF3D5430) 
                    : const Color(0xFFC8E6C9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected 
                      ? const Color(0xFF3D5430) 
                      : Colors.grey[400]!,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.black,
                        width: 2,
                      ),
                    ),
                    child: isSelected 
                        ? Center(
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    time,
                    style: GoogleFonts.reemKufi(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}