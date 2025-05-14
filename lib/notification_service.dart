import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationPlugin =
  FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> initNotification() async {
    if (_isInitialized) return;

    const initSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettings = InitializationSettings(android: initSettingsAndroid);

    await notificationPlugin.initialize(initSettings);
    _isInitialized = true;
  }

  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'task_notification',
        'Task Notification',
        channelDescription: 'Task Notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    await notificationPlugin.show(
      id,
      title,
      body,
      _notificationDetails(),
    );
  }
}
