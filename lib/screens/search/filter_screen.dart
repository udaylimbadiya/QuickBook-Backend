import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Price Range'),
            Slider(value: 0.5, onChanged: (value) {}),
            SizedBox(height: 16),
            Text('Rating'),
            Slider(value: 0.5, onChanged: (value) {}),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
