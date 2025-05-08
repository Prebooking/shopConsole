import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:slotitconsole/Screens/Room/views/roomtable.dart';
import 'package:slotitconsole/Screens/StaffScreens/views/staffcard.dart';

class StaffMainScreen extends StatelessWidget {
  const StaffMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
 
     Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                    Text(
                        "Shop Staffs",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
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
                            'Staffs',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                ],
              ),
             const Spacer(),
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
          ),
          const SizedBox(height: 24),
            
      
      Expanded(
        child: GridView.builder(
        
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( maxCrossAxisExtent: 200,
    mainAxisExtent: 260,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
                  ), itemCount: 6,
                  itemBuilder: (context, index) {
                  return Staffcard(name: "Nandana S I", phone: "7736204597", imageUrl: "", isSelected: false, isActive: true);
                },),
      )
        ],
      )
      
      
    
    );

  
  }
}


