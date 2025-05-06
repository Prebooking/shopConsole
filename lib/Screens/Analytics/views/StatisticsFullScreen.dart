import 'package:flutter/material.dart';
import 'package:slotitconsole/Screens/Analytics/views/statisticstable.dart';

class FullStaticstics extends StatelessWidget {
  const FullStaticstics({super.key});

  @override
  Widget build(BuildContext context) {
    return 
          Expanded(
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
             mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                      const Text(
                   'Statistic',
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w600,
                     color: Colors.black
                   ),
                 ),
                 
                  const Text(
                   'Revenue and Sale',
                   style: TextStyle(
                     fontSize: 14,
                     fontWeight: FontWeight.w400,
                     color: Colors.grey
                   ),
                 ),
                   ],
                 ),
                 Expanded(child: Container()),
             CircleAvatar(backgroundColor: Color(0xff074762),radius: 4,),
               SizedBox(width: 5,),
                                     
                  const Text(
                   'Revenue',
                   style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 SizedBox(width: 10,),
                 CircleAvatar(backgroundColor:Color(0xffF86624)  ,radius: 4,),
                 SizedBox(width: 5,), const Text(
                   'Sales',
                   style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
               
             ),
                   const SizedBox(height: 16),
                   Expanded(child:StaticTable()),],
        ),
      ),
    ));
    
  }
}