

import 'dart:developer';

import 'package:acdemy/core/helper/Services/Api_Services.dart';
import 'package:acdemy/core/helper/Services/Dio.dart';
import 'package:acdemy/core/helper/Services/LocalNotificationServices.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class PushNotificationServices {

  static final  ApiService apiservice =DioConsumer(dio: Dio()) ;
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    await messaging.requestPermission();
    await messaging.getToken().then((token) {
    log("fcm token is ${token}");
      if (token != null) {
        // sendTokentoServer(FCMtoken: token);
      }
    });
  // messaging.onTokenRefresh.listen(
  //     (token) {
  //       sendTokentoServer(FCMtoken: token);
  //     },
  //   );


    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          // var   data = message.data;

          log("received message with notification payload: ${message.notification!.body}");

          LocaNotificationServices.showBasicNotification(
            id: 0,
            body: message.notification!.body ?? 'No body',
            title: message.notification!.title ?? 'No title',
            payload: message.data['type'],
          );
        } else {
          log("Received message without notification payload");
        }
      },
    );
  }

  static Future<void> sendTokentoServer({required String FCMtoken}) async {
  var response = await apiservice.post(ApiEndpoints.sendFcmToken, data: {"token": FCMtoken});

  }
}
