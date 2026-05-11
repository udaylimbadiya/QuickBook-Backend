import 'package:flutter/material.dart';

class ManageBookingScreen extends StatelessWidget {
  const ManageBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Bookings')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('Booking $index'),
              subtitle: Text('Customer Name'),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text('Approve')),
                  PopupMenuItem(child: Text('Reject')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
