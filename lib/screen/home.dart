import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/signin.dart';
import 'package:flutter_application_1/screen/schedule_screen.dart'; // Import the schedule screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Manage Schedules"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScheduleScreen()), 
            );
          },
        ),
      ),
    );
  }
}
