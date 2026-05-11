import 'package:flutter/material.dart';

class ServiceManagement extends StatelessWidget {
  const ServiceManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Service Management')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('Service $index'),
              subtitle: Text('Category'),
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
