// import 'dart:developer';

// import 'package:acdemy/core/helper/Services/LocalNotificationServices.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart'; // package firebase_core

// // package firebase_notificaion

// @pragma('vm:entry-point') // for back ground notification
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

// class PushNotificationServices {
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;

//   static Future<void> init() async {
//     await messaging.requestPermission();

//     String? token = await messaging.getToken();
//     log('📱 FCM Token: ${token ?? 'No token'}');

//     // forground notification
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      
//       if (message.notification != null) {
//              log("received message with notification payload"+message.notification!.body.toString());
//         LocaNotificationServices.showBasicNotification(
     
//           id: 0,
//           body: message.notification!.body ?? 'No body',
//           title: message.notification!.title ?? 'No title',
//         );
    
//       } else {
//         log(" Received message without notification payload");
//       }
//     });
//   }

//   // for foreground notification
// }

import 'dart:developer';
import 'package:acdemy/core/helper/Services/LocalNotificationServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class PushNotificationServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    log('📱 FCM Token: ${token ?? 'No token'}');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  
      if (message.notification != null) {
        log("received message with notification payload: ${message.notification!.body}");

        LocaNotificationServices.showBasicNotification(
          id: 0,
          body: message.notification!.body ?? 'No body',
          title: message.notification!.title ?? 'No title',
          // payload: 'firebase notification',
        );
      } else {
        log("Received message without notification payload");
      }
    });
  }
}

