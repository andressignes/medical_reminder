import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> initialize({bool initSchedule = true}) async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        log('onDidReceiveLocalNotification: $id');
      },
    );
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _notifications.initialize(
      initializationSettings,
      onSelectNotification: (payload) async {
        log('onSelectNotification: $payload');
      },
    );

    if (initSchedule) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _getNotificationDetails(),
        payload: payload,
      );

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDateTime,
  }) async {
    log('Notification: $scheduledDateTime - $body');
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime(
        tz.local,
        scheduledDateTime.year,
        scheduledDateTime.month,
        scheduledDateTime.day,
        scheduledDateTime.hour,
        scheduledDateTime.minute,
        scheduledDateTime.second,
      ),
      await _getNotificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  static Future<NotificationDetails> _getNotificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        channelDescription: 'channelDescription',
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );
    final scheduledTime = scheduledDate.isBefore(now)
        ? scheduledDate.add(const Duration(days: 1))
        : scheduledDate;
    return scheduledTime;
  }

  static Future cancelNotification(int id) async => _notifications.cancel(id);

  static Future cancelAllNotifications() async => _notifications.cancelAll();
}
