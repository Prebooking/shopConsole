import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String imageUrl;
  final String roomName;
  final String description;
  final int staffCount;
  final String status;

  const RoomCard({
    super.key,
    required this.imageUrl,
    required this.roomName,
    required this.description,
    required this.staffCount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 500;
    final fontSize = isSmall ? 11.0 : 13.0;
    final imageHeight = isSmall ? 100.0 : 130.0;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Info Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title & Count
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        roomName,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: fontSize),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '$staffCount staffs',
                      style: TextStyle(fontSize: fontSize - 1, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
                  children: [
                    Text(
                      description,
                      style: TextStyle(fontSize: fontSize - 1, color: Colors.grey),
                    ),
                     Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: fontSize - 1, color: Colors.green),
                  ),
                ),
                  ],
                ),
                const SizedBox(height: 6),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
