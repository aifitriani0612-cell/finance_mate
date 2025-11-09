import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TransactionModel> transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
          ).createShader(bounds),
          child: Text(
            'Finance Mate',
            style: GoogleFonts.pacifico(
              textStyle: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Title =====
            Text(
              'My Cards',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 12),

            // ===== Banner Cards =====
            SizedBox(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank BCA',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    color1: Color(0xFF8E2DE2),
                    color2: Color(0xFF4A00E0),
                    hasShinyEffect: true,
                  ),
                  AtmCard(
                    bankName: 'Bank Mandiri',
                    cardNumber: '**** 8765',
                    balance: 'Rp8.950.000',
                    color1: Color(0xFFFFA17F),
                    color2: Color(0xFF00223E),
                  ),
                  AtmCard(
                    bankName: 'Bank BRI',
                    cardNumber: '**** 5523',
                    balance: 'Rp5.350.000',
                    color1: Color(0xFF43CEA2),
                    color2: Color(0xFF185A9D),
                    hasShinyEffect: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ===== Quick Access =====
            Text(
              'Quick Access',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  GridMenuItem(
                    iconPath: 'assets/icons/health.jpg',
                    label: 'Health',
                    isSmall: true,
                  ),
                  SizedBox(width: 12),
                  GridMenuItem(
                    iconPath: 'assets/icons/travel.jpg',
                    label: 'Travel',
                    isSmall: true,
                  ),
                  SizedBox(width: 12),
                  GridMenuItem(
                    iconPath: 'assets/icons/pizza.jpg',
                    label: 'Food',
                    isSmall: true,
                  ),
                  SizedBox(width: 12),
                  GridMenuItem(
                    iconPath: 'assets/icons/event.jpg',
                    label: 'Event',
                    isSmall: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ===== Transaction List =====
            Text(
              'Recent Transactions',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
