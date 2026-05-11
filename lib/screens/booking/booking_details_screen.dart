import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking Details')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service: Salon Services'),
            SizedBox(height: 16),
            Text('Date: 2024-05-09'),
            SizedBox(height: 16),
            Text('Time: 2:00 PM'),
            SizedBox(height: 16),
            Text('Price: ₹500'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Cancel Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
