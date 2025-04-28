import 'package:flutter/material.dart';
import 'package:slotitconsole/Screens/BookingListScreen/Views/BookingTableView.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text(
          'Bookings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Manage your salon easily',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 20,),
    
    Expanded(
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Appointments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
      Expanded(child: BookingHistoryTable())
           
            ],
          ),
        ),
      ),
    )
      
        ],
      ),
    );
  }
}