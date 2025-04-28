import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayScheduleHome extends StatelessWidget {
  TodayScheduleHome({super.key});

  final List<RoomAppointment> appointments = [
    RoomAppointment(
      room: 'Room 1',
      bookings: [
        BookingSlot(
          startTime: DateTime.now().copyWith(hour: 9, minute: 0),
          endTime: DateTime.now().copyWith(hour: 11, minute: 0),
          customer: 'John D.',
          service: 'Haircut',
          color: Colors.blue[400]!,
        ),
        BookingSlot(
          startTime: DateTime.now().copyWith(hour: 14, minute: 0),
          endTime: DateTime.now().copyWith(hour: 16, minute: 0),
          customer: 'Sarah M.',
          service: 'Coloring',
          color: Colors.purple[400]!,
        ),
      ],
    ),
    RoomAppointment(
      room: 'Room 2',
      bookings: [
        BookingSlot(
          startTime: DateTime.now().copyWith(hour: 10, minute: 0),
          endTime: DateTime.now().copyWith(hour: 12, minute: 0),
          customer: 'Mike T.',
          service: 'Shave',
          color: Colors.green[400]!,
        ),
        BookingSlot(
          startTime: DateTime.now().copyWith(hour: 15, minute: 0),
          endTime: DateTime.now().copyWith(hour: 17, minute: 0),
          customer: 'Emma L.',
          service: 'Facial',
          color: Colors.orange[400]!,
        ),
      ],
    ),
    RoomAppointment(
      room: 'Room 3',
      bookings: [
        BookingSlot(
          startTime: DateTime.now().copyWith(hour: 8, minute: 30),
          endTime: DateTime.now().copyWith(hour: 10, minute: 0),
          customer: 'John',
          service: 'Cleaning',
          color: Colors.orange[400]!,
        ),
         BookingSlot(
          startTime: DateTime.now().copyWith(hour: 8, minute: 0),
          endTime: DateTime.now().copyWith(hour: 9, minute: 00),
          customer: 'David K.',
          service: 'Massage',
          color: Colors.red[400]!,
        ),
        BookingSlot(
          startTime: DateTime.now().copyWith(hour: 13, minute: 0),
          endTime: DateTime.now().copyWith(hour: 15, minute: 0),
          customer: 'Lisa P.',
          service: 'Spa',
          color: Colors.teal[400]!,
        ),
      ],
    ),
  ];

  final now = DateTime.now();
  final hours = List.generate(24, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with date navigation
            _buildScheduleHeader(),
            const SizedBox(height: 16),
            
            // Time scale header
            _buildTimeScaleHeader(),
            
            // Gantt chart rows
            _buildGanttChartRows(context),
            
            // Action buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Today's Room Schedule",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, size: 20),
              onPressed: () {},
              splashRadius: 20,
              tooltip: 'Previous day',
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Today'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, size: 20),
              onPressed: () {},
              splashRadius: 20,
              tooltip: 'Next day',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeScaleHeader() {
    return SizedBox(
      height: 40,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          // Synchronize horizontal scrolling with chart rows
          return true;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: hours.map((hour) {
              return Container(
                width: 60,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    '$hour:00',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildGanttChartRows(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: appointments.length * 60.0,
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: appointments.map((room) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        // Room row
                        SizedBox(
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Room label
                              Container(
                                width: 80,
                                padding: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey[200]!,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    room.room,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              // Time slots
                              Expanded(
                                child: NotificationListener<ScrollNotification>(
                                  onNotification: (notification) {
                                    // Handle scroll synchronization if needed
                                    return true;
                                  },
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      width: 24 * 60.0, // 24 hours * 60px
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          // Time grid background
                                          Row(
                                            children: hours.map((hour) {
                                              return Container(
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    right: BorderSide(
                                                      color: Colors.grey[100]!,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  color: Colors.grey[50],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                          
                                          // Booking slots
                                          ...room.bookings.map((booking) {
                                            final startHour = booking.startTime.hour;
                                            final startMinute = booking.startTime.minute;
                                            final endHour = booking.endTime.hour;
                                            final endMinute = booking.endTime.minute;
                                            final duration = (endHour - startHour) * 60 + (endMinute - startMinute);
                                            final left = (startHour * 60 + startMinute).toDouble();
                                            
                                            return Positioned(
                                              left: left,
                                              width: duration.toDouble(),
                                              child: Container(
                                                height: 40,
                                                margin: const EdgeInsets.only(top: 5),
                                                decoration: BoxDecoration(
                                                  color: booking.color.withOpacity(0.9),
                                                  borderRadius: BorderRadius.circular(6),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black.withOpacity(0.1),
                                                      blurRadius: 4,
                                                      offset: const Offset(0, 2),
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Tooltip(
                                                    richMessage: WidgetSpan(
                                                      child: Container(
                                                        padding: const EdgeInsets.all(8),
                                                        constraints: const BoxConstraints(maxWidth: 200),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              booking.service,
                                                              style: const TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            const SizedBox(height: 4),
                                                            Text('Customer: ${booking.customer}'),
                                                            Text('Room: ${room.room}'),
                                                            Text('Time: ${DateFormat('h:mm a').format(booking.startTime)} - ${DateFormat('h:mm a').format(booking.endTime)}'),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                                      child: Text(
                                                        booking.customer,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1, thickness: 1),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.calendar_today, size: 16),
            label: const Text('Select Days'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue[600],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 16),
            label: const Text('Add Appointment'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green[600],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoomAppointment {
  final String room;
  final List<BookingSlot> bookings;

  RoomAppointment({required this.room, required this.bookings});
}

class BookingSlot {
  final DateTime startTime;
  final DateTime endTime;
  final String customer;
  final String service;
  final Color color;

  BookingSlot({
    required this.startTime,
    required this.endTime,
    required this.customer,
    required this.service,
    required this.color,
  });
}