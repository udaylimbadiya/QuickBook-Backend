import 'package:flutter/material.dart';

class RevenueScreen extends StatelessWidget {
  const RevenueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Revenue')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Revenue'),
                    SizedBox(height: 8),
                    Text('₹150,000', style: TextStyle(fontSize: 24)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Transaction $index'),
                      subtitle: Text('2024-05-0${9 - (index % 9)}'),
                      trailing: Text('₹500'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
