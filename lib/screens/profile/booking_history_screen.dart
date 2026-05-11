import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking History')),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('Booking $index'),
              subtitle: Text('2024-0${5 - (index ~/ 5)}-${09 + (index % 5)}'),
              trailing: Text('Completed'),
            ),
          );
        },
      ),
    );
  }
}
