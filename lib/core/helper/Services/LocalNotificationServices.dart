import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocaNotificationServices {
static StreamController<NotificationResponse> streamController =
    StreamController<NotificationResponse>.broadcast();

static String? initialNotificationPayload;


static onTap(NotificationResponse notificationResponse) {
  initialNotificationPayload = notificationResponse.payload;
  
  
  streamController.add(notificationResponse);
}

  // set up
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    InitializationSettings settings =const  InitializationSettings(
        android: AndroidInitializationSettings("ic_launcher"),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse:
            onTap,
        onDidReceiveBackgroundNotificationResponse:
            onTap);
  }

  // basic notification
 static Future<void> showBasicNotification({
  required String? title,
  required String? body,
  required int id,
  String? payload,
  
}) async {
  NotificationDetails notificationDetails = NotificationDetails(

    android: AndroidNotificationDetails(
      "channelId",
      "channelName",
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher',
  sound: RawResourceAndroidNotificationSound(
  'mixkit_software_interface_start_2574.wav'.split(".").first
),
      showWhen: true,
      color: Colors.red,
      category: AndroidNotificationCategory.reminder,
  
    
    ),
  );

  await flutterLocalNotificationsPlugin.show(
    id,
    title,
    body,
    notificationDetails,
    payload:payload,
  );
}



  // cancled notification
  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  // cancled All  notification
  static void cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}


