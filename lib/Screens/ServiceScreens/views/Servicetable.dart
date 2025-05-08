import 'package:flutter/material.dart';

class Servicetable extends StatelessWidget {
  const Servicetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Table Container
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
              border: TableBorder(
               top: BorderSide(color: Colors.grey[100]!),
    bottom: BorderSide(color: Colors.grey[100]!),
              ),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(0.5),
                2: FlexColumnWidth(0.5),
                3: FixedColumnWidth(80),
                4: FixedColumnWidth(100),
                5: FixedColumnWidth(100),
                6: FixedColumnWidth(80),
              },
              children: [
                // Table Header
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[50]),
                  children: [
                    _buildHeaderCell('Service'),
                    _buildHeaderCell('Gender'),
                    _buildHeaderCell('Room'),
                    _buildHeaderCell('Charge'),
                    _buildHeaderCell('Sale Price'),
                    _buildHeaderCell('Duration'),
                    _buildHeaderCell('Action'),
                  ],
                ),

                // Table Rows (example repeated rows)
                for (int i = 0; i < 10; i++)
                  _buildTableRow(
                    imgurl: 'https://th.bing.com/th/id/OIP.zhXbmHtkW0vqrzWVtWumZAHaE0?w=287&h=187&c=7&r=0&o=7&pid=1.7',
                    servicetitle: "Bag & Pouch",
                    servicesubTitle: "Greatest fashion, great selections.",
                    gender: "Female",
                    room: 'Room 1',
                    charge: "12.00",
                    price: "10",
                    duration: "10 min",
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
                'Showing 1-10 of 100 appointments',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,color: Colors.grey, size: 16),
                    onPressed: () {},
                    tooltip: 'Previous page',
                  ),
                  const SizedBox(width: 8),
                  Text('1', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,color: Colors.grey, size: 16),
                    onPressed: () {},
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

  /// Header Cell Widget
  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 13,
        ),
      ),
    );
  }

  /// Table Row Builder
  TableRow _buildTableRow({
    required String imgurl,
    required String servicetitle,
    required String servicesubTitle,
    required String gender,
    required String room,
    required String charge,
    required String price,
    required String duration,
  }) {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.white),
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imgurl, height: 40, width: 40, fit: BoxFit.cover),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(servicetitle, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    Text(servicesubTitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              )
            ],
          ),
        ),
        _buildCell(gender),
        _buildCell(room),
        _buildCell(charge),
        _buildCell(price),
        _buildCell(duration),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.edit, size: 18, color: Colors.grey),
              SizedBox(width: 8),
              Icon(Icons.delete, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  /// Generic Cell Builder
  Widget _buildCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(text, style: const TextStyle(fontSize: 13,color: Colors.grey)),
    );
  }
}
