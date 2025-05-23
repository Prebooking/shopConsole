import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slotitconsole/Dashboard/DashBoardMain.dart';
import 'package:slotitconsole/Screens/Authentication/authentication.dart';

void main() {
  runApp(const SalonDashboardApp());
}

class SalonDashboardApp extends StatelessWidget {
  const SalonDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SLOTIT - Salon Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // routes: {
      //   "/analytics": (context) => SalonDashboard(index: 1),
      //   "/": (context) => SalonDashboard(index: 0),
      // },
      // initialRoute: "/",
      home: AuthenticationScreen(),
    );
  }
}
