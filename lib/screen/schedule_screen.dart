import 'package:flutter/material.dart';

class Schedule {
  final String title;
  final DateTime dateTime;

  Schedule({required this.title, required this.dateTime});
}

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final List<Schedule> schedules = [];
  TextEditingController _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedules'),
      ),
      body: ListView.builder(
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(schedules[index].title),
            subtitle: Text(
              '${schedules[index].dateTime.toLocal()}',
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Show a dialog to add a new schedule
          await _showAddScheduleDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddScheduleDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Schedule'),
          content: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null &&
                            pickedDate != _selectedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Text('Select Date'),
                    ),
                    SizedBox(width: 20),
                    Text('Date: ${_selectedDate.toLocal()}'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: _selectedTime,
                      );

                      if (pickedTime != null &&
                          pickedTime != _selectedTime) {
                        setState(() {
                          _selectedTime = pickedTime;
                        });
                      }
                    },
                    child: Text('Select Time'),
                  ),
                  SizedBox(width: 20),
                  Text('Time: ${_selectedTime.format(context)}'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add the new schedule to the list
                setState(() {
                  schedules.add(
                    Schedule(
                      title: _titleController.text,
                      dateTime: DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        _selectedTime.hour,
                        _selectedTime.minute,
                      ),
                    ),
                  );
                });

                // Clear the fields
                _titleController.clear();
                _selectedDate = DateTime.now();
                _selectedTime = TimeOfDay.now();

                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

