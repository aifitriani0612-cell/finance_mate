import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  IconData getCategoryIcon(String category) {
    switch (category) {
      case 'Food':
        return Icons.fastfood;
      case 'Travel':
        return Icons.flight_takeoff;
      case 'Health':
        return Icons.health_and_safety;
      case 'Event':
        return Icons.event;
      case 'Income':
        return Icons.attach_money;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isIncome = transaction.amount.contains('+');

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10, // jarak antar item (lebih longgar dari sebelumnya)
        horizontal: 14,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12, // ruang dalam card lebih besar
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🔹 Ikon kategori kecil dengan jarak nyaman
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              getCategoryIcon(transaction.category),
              size: 26,
              color: Colors.teal,
            ),
          ),
          const SizedBox(width: 16), // jarak ikon dan teks

          // 🔹 Informasi transaksi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction.category,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Jumlah transaksi
          Text(
            transaction.amount,
            style: TextStyle(
              color: isIncome ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
