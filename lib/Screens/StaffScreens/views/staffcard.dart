import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Staffcard extends StatelessWidget {
 final String name;
  final String phone;
  final String imageUrl;
  final bool isSelected;
  final bool isActive;

  const Staffcard({
    super.key,
    required this.name,
    required this.phone,
    required this.imageUrl,
    required this.isSelected,
    required this.isActive,
  });
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,Constraints){
      double cardWidth = Constraints.maxWidth;
        bool isCompact = cardWidth < 180;
        return  Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey.shade100),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              // Top row with selection and menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                    color: Colors.grey.shade500,
                    size: 20,
                  ),
                  const Icon(Icons.more_vert, size: 20, color: Colors.black),
                ],
              ),
              const SizedBox(height: 10),

              // Avatar
              CircleAvatar(
                radius: isCompact ? 30 : 40,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: NetworkImage(imageUrl),
              ),
              const SizedBox(height: 10),

              // Name
              Text(
                name,
                style: TextStyle(
                  fontSize: isCompact ? 13 : 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Phone
              Text(
                phone,
                style: TextStyle(
                  fontSize: isCompact ? 11 : 13,
                  color: Colors.grey[600],
                ),
              ),

              const Divider(),
              SizedBox(height: 10),
              // Status
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isActive ? Colors.green.shade50 : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isActive ? 'Active' : 'Blocked',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isActive ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
    });

  }
}
