import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking History')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('Booking ${index + 1}'),
              subtitle: Text('Service: Salon Services\nDate: 2024-05-09\nStatus: Completed'),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}