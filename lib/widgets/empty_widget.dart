import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String? message;
  final Widget? icon;

  const EmptyWidget({
    Key? key,
    this.message = 'No data available',
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Icon(Icons.inbox, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(message!),
        ],
      ),
    );
  }
}
