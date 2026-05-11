import 'package:flutter/material.dart';

class NearbyServices extends StatelessWidget {
  const NearbyServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nearby Services'),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Nearby Service $index'),
                subtitle: Text('Distance: ${index} km'),
              ),
            );
          },
          itemCount: 5,
        ),
      ],
    );
  }
}
