import 'package:flutter/material.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Management')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('User $index'),
              subtitle: Text('user$index@example.com'),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text('Block')),
                  PopupMenuItem(child: Text('Delete')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
