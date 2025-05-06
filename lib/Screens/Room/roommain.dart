import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:slotitconsole/Screens/Room/views/roomtable.dart';

class Roommain extends StatelessWidget {
  const Roommain({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    LayoutBuilder(builder: (context,Constraints){
     int count=1;
     if(Constraints.maxWidth>=800){
      count=4;
     }
     else if(Constraints.maxWidth>600){
      count=3;
     }
     else if(Constraints.maxWidth>400){
      count=2;
     }
     else {
      count=1;
     }
     return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                    Text(
                        "Shop Room",
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
                            'Room',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                ],
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
          ),
          const SizedBox(height: 24),
            
      
      Expanded(
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: count,
          crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: 3 / 3,
                  ), itemBuilder: (context, index) {
                  return RoomCard(
                    imageUrl: 'https://th.bing.com/th/id/OIP.zhXbmHtkW0vqrzWVtWumZAHaE0?w=287&h=187&c=7&r=0&o=7&cb=iwp1&dpr=1.3&pid=1.7&rm=3',
                    roomName: 'Room Name',
                    description: 'Description',
                    staffCount: 0,
                    status: 'Active',
                  );
                },),
      )
        ],
      )
      
      
    
    );

    }
    );
  }
}


