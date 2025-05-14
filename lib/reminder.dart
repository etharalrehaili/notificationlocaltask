import 'package:flutter/material.dart';
import 'package:untitled1/notification_service.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NotificationService().showNotification(
              title: "Study Android",
              body: "3:00 PM",
            );
          },
          child: const Text("Send Notification"),
        ),
      ),
    );
  }
}
