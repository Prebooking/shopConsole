import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slotitconsole/Screens/BookingListScreen/BookingListScreen.dart';
import 'package:slotitconsole/Screens/DashboarScreen/DashBoardScreen.dart';

class SalonDashboard extends StatefulWidget {
  int index;
  SalonDashboard({super.key, this.index = 0});

  @override
  State<SalonDashboard> createState() => _SalonDashboardState();
}

class _SalonDashboardState extends State<SalonDashboard> {
  int _currentIndex = 1;
  bool _isSidebarCollapsed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.index;

    print(widget.index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  _isSidebarCollapsed = !_isSidebarCollapsed;
                });
              },
            ),
            const Text('SLOTIT'),
          ],
        ),
        actions: [],
      ),
      body: Row(
        children: [
          // Sidebar Navigation - Matches screenshot exactly
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarCollapsed ? 70 : 200,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildNavItem('Dashboard', Icons.dashboard, 0),
                _buildNavItem('Analytics', Icons.analytics, 1),
                _buildNavItem('Booking', Icons.calendar_today, 2),
                _buildNavItem('Specialist', Icons.person, 3),
                _buildNavItem('Services', Icons.spa, 4),
                _buildNavItem('Staff', Icons.people, 5),
                const Divider(),
                _buildNavItem('Settings', Icons.settings, 6),
                _buildNavItem('Info & Help', Icons.help_outline, 7),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child:
                (_currentIndex == 0)
                    ? DashBoardScreen()
                    : BookingHistoryScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, IconData icon, int index) {
    return ListTile(
      leading: Icon(
        icon,
        color: _currentIndex == index ? Colors.blue : Colors.grey[600],
      ),
      title:
          _isSidebarCollapsed
              ? null
              : Text(
                title,
                style: TextStyle(
                  color: _currentIndex == index ? Colors.blue : Colors.black,
                  fontWeight:
                      _currentIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                ),
              ),
      selected: _currentIndex == index,
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
