import 'package:flutter/material.dart';

class FeaturedServices extends StatelessWidget {
  const FeaturedServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Featured Services'),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('Service $index'),
                subtitle: Text('Description'),
              ),
            );
          },
          itemCount: 5,
        ),
      ],
    );
  }
}
