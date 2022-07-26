import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'dart:convert';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String>();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings = InitializationSettings(android: android);

    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );

    if (initScheduled) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static int getHas({String eventID = "asdnasjdnaskdnbaihbd2in1en213123"}) {
    int notificationId = eventID.hashCode;
    return notificationId;
  }

  static Future<void> cancelNotification({int id}) async {
    await _notifications.cancel(id);
  }

// Future<void> deleteNotificationChannel(String channelId) =>
//     _channel.invokeMethod('deleteNotificationChannel', channelId);
  static Future showNotification({
    int id = 0,
    String title,
    String body,
    String payload,
  }) async {
    _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

  // static Future showScheduledNotification({
  //   int id = 0,
  //   String title,
  //   String body,
  //   String payload,
  //   DateTime scheduledDate,
  // }) async {
  //   print("doing notif here");
  //   _notifications.zonedSchedule(
  //     id,
  //     title,
  //     body,
  //     _scheduleDaily(Time(6)),
  //     tz.TZDateTime.from(scheduledDate, tz.local),
  //     await _notificationDetails(),
  //     payload: payload,
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //   );

  //   static tz.TZDateTIme _scheduleDail(TIme time)
  // }

  static void showScheduledNotification({
    int id,
    String title,
    String body,
    String payload,
    int hour,
    int minute,
  }) async {
    final scheduledDates = _scheduleWeekly(Time(hour, minute), days: [
      DateTime.monday,
      DateTime.tuesday,
      DateTime.wednesday,
      DateTime.thursday,
      DateTime.friday,
      DateTime.saturday,
      DateTime.sunday
    ]);

    for (int i = 0; i < scheduledDates.length; i++) {
      final scheduledDate = scheduledDates[i];

      _notifications.zonedSchedule(
        id + i, // choose for each notification an index that is unique
        title,
        body,
        scheduledDate,
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    }
  }

  static List<tz.TZDateTime> _scheduleWeekly(Time time, {List<int> days}) {
    return days.map((day) {
      tz.TZDateTime scheduledDate = _scheduleDaily(time);

      while (day != scheduledDate.weekday) {
        scheduledDate = scheduledDate.add(Duration(days: 1));
      }
      return scheduledDate;
    }).toList();
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(days: 1))
        : scheduledDate;
  }
}
