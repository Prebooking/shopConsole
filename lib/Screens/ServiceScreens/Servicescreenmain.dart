  import 'package:flutter/material.dart';
import 'package:slotitconsole/Screens/ServiceScreens/views/Servicetable.dart';
class ServiceMainScreen extends StatelessWidget {
  const ServiceMainScreen({super.key});

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
                      _buildAppointmentsTable(),
          ]
        ),
      ),
    );
  }
}
  Widget _buildWelcomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Shop Services',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
          Row(
                        children: [
                           Text(
                            'Dashboard',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                           Text(
                            'Services',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                           Expanded(child: Container()),
                   ElevatedButton.icon(onPressed: (){},
                    icon: const Icon(Icons.add,color: Colors.grey,),
                    label: Text('Add Service',style: TextStyle(color: Colors.grey),),
                    style: ElevatedButton.styleFrom(// backgroundColor: const Color(0xFF003F5F), // Dark blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      textStyle: const TextStyle(fontSize: 14),
                      ),
                    )
                          
                        ],
                      )
      ],
    );
  }


Widget _buildAppointmentsTable() {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Servicetable(),
      ),
    );
  }