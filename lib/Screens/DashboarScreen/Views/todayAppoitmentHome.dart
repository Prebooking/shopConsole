import 'package:flutter/material.dart';

class Todayappoitmenthome extends StatelessWidget {
  const Todayappoitmenthome({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // Table Controls
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search appointments...',
                  prefixIcon: const Icon(Icons.search, size: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  isDense: true,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {},
                  tooltip: 'Previous',
                  splashRadius: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: 8),
                      const Text('Select Date'),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                  tooltip: 'Next',
                  splashRadius: 20,
                ),
              ],
            ),
          ],
        ),
      ),
      
      // Table
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(color: Colors.grey[100]!),
            ),
            columnWidths: const {
              0: FixedColumnWidth(100),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(1.5),
              3: FixedColumnWidth(100),
              4: FixedColumnWidth(100),
              5: FixedColumnWidth(120),
            },
            children: [
              // Table Header
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                ),
                children: [
                  _buildHeaderCell('Time'),
                  _buildHeaderCell('Customer'),
                  _buildHeaderCell('Service'),
                  _buildHeaderCell('Amount'),
                  _buildHeaderCell('Room'),
                  _buildHeaderCell('Status'),
                ],
              ),
              
              // Table Rows
              _buildTableRow(
                time: '2:00 PM',
                customer: 'John Doe',
                service: 'Haircut',
                amount: '¥100.00',
                room: 'Room 1',
                status: 'waiting',
                statusColor: Colors.orange,
              ),
              _buildTableRow(
                time: '8:15 PM',
                customer: 'Jane Smith',
                service: 'Massage',
                amount: '¥125.00',
                room: 'Room 2',
                status: 'processing',
                statusColor: Colors.blue,
              ),
              _buildTableRow(
                time: '11:30 AM',
                customer: 'Alice Brown',
                service: 'Spa Treatment',
                amount: '¥200.00',
                room: 'Room 3',
                status: 'completed',
                statusColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
      
      // Table Footer
      Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Showing 1-3 of 3 appointments',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 16),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  tooltip: 'Previous page',
                ),
                const SizedBox(width: 8),
                Text(
                  '1',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  tooltip: 'Next page',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildHeaderCell(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.grey[700],
        fontSize: 13,
      ),
    ),
  );
}

TableRow _buildTableRow({
  required String time,
  required String customer,
  required String service,
  required String amount,
  required String room,
  required String status,
  required Color statusColor,
}) {
  return TableRow(
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          time,
          style: const TextStyle(fontSize: 13),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          customer,
          style: const TextStyle(fontSize: 13),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          service,
          style: const TextStyle(fontSize: 13),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          amount,
          style: const TextStyle(fontSize: 13),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          room,
          style: const TextStyle(fontSize: 13),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: statusColor.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            status.toUpperCase(),
            style: TextStyle(
              color: statusColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    ],
  );
}
}