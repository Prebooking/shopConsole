import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slotitconsole/Screens/DashboarScreen/Views/todayAppoitmentHome.dart';
import 'package:slotitconsole/Screens/DashboarScreen/Views/todayScheduleHome.dart';

class DashBoardScreen extends StatelessWidget {
   DashBoardScreen({super.key});


final DateTime _selectedDate = DateTime.now();
  final List<Appointment> _appointments = [
    Appointment(
      time: '2:00 PM',
      customer: 'John Doe',
      service: 'Haircut',
      amount: 100.00,
      room: 'Room1',
      status: 'Ready',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeHeader(),
                      const SizedBox(height: 20),
                      _buildStatsRow(),
                      const SizedBox(height: 20),
                      TodayScheduleHome(),
                      const SizedBox(height: 20),
                      _buildAppointmentsTable(),
          ],
        ),
      ),
    );
  }


  Widget _buildWelcomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome Jay',
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
      ],
    );
  }

  Widget _buildStatsRow() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 800;
        return isWide
            ? Row(
                children: [
                  _buildStatCard('Total Bookings', '6784', 'Last one month'),
                  const SizedBox(width: 16),
                  _buildStatCard('Total Earnings', '\$1920', 'Last one month'),
                  const SizedBox(width: 16),
                  _buildStatCard('Total Customers', '4412', 'Last one month'),
                  const SizedBox(width: 16),
                  _buildStatCard('Waiting', '329', 'Last one month'),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                            'Total Bookings', '6784', 'Last one month'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildStatCard(
                            'Total Earnings', '\$1920', 'Last one month'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                            'Total Customers', '4412', 'Last one month'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildStatCard('Waiting', '329', 'Last one month'),
                      ),
                    ],
                  ),
                ],
              );
      },
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle) {
    return Expanded(
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoomScheduleSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today's Room Schedule",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {},
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Today'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              DateFormat('EEEE dd.MM.yyyy').format(_selectedDate),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${index.toString().padLeft(2, '0')}:00',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today, size: 16),
                  label: const Text('Select Days'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Add Appointment'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentsTable() {
    return Card(
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
Todayappoitmenthome()
         
          ],
        ),
      ),
    );
  }

  

}

class Appointment {
  final String time;
  final String customer;
  final String service;
  final double amount;
  final String room;
  final String status;

  Appointment({
    required this.time,
    required this.customer,
    required this.service,
    required this.amount,
    required this.room,
    required this.status,
  });
}