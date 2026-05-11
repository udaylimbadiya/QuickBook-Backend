import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Analytics')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Monthly Statistics'),
            SizedBox(height: 16),
            // Add charts here
            Expanded(
              child: Center(
                child: Text('Chart Widget'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
