// ignore_for_file: avoid_returning_null_for_void

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    

    // Init localnotification plugin
    init () async{
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(onDidReceiveLocalNotification: (id, title, body, payload) => null, );
    const LinuxInitializationSettings initializationSettingsLinux =
    LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
   }





   showNotification ({required String title , required String dateTime, required String payload}) async{
      const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        timeoutAfter: 5000,
        styleInformation: DefaultStyleInformation(true, true),
        );
        const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
        await flutterLocalNotificationsPlugin.show(
         0, title, dateTime, notificationDetails,
        payload: payload);
   }
}