import 'package:flutter/material.dart';
import 'package:slotitconsole/Screens/Analytics/views/StatisticsFullScreen.dart';
import 'package:slotitconsole/Screens/Analytics/views/statisticstable.dart';

class AnalyticScreen extends StatelessWidget {
   AnalyticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20
      ),
      
        child: Column(
         //  crossAxisAlignment: CrossAxisAlignment.start,
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
           _buildWelcome(),
          const SizedBox(height: 20,),
            _buildStatsRow(),
          const SizedBox(height: 20,),
          Expanded(child: FullStaticstics())
          ],
        ),
      
      
    );
  }
}
Widget _buildWelcome(){
  return  Row(
   mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Text(
              'Welcome Back Jay',
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
           // SizedBox(height: 20,),
              
             
          
            ],
          ),
          Expanded(child: Container()),
          
           Container(
                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month, size: 16),
                      const SizedBox(width: 8),
                      const Text('Select Date'),
                    ],
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