import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinycolor2/tinycolor2.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(
    GetMaterialApp(
      // theme: ThemeData.light().copyWith(
      //   primarySwatch: Colors.blue,
      //   primaryColor: Colors.blue,
      //
      // ),

      // darkTheme: ThemeData.dark().copyWith(
      //   //backgroundColor: Colors.black38,
      //   cardColor: Colors.black26,
      //   primaryColor: Colors.black26,
      //   backgroundColor: Colors.black26,
      //  scaffoldBackgroundColor: Colors.black26,
      //   bottomAppBarColor: Colors.black26,
      //
      // ),
      theme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: "Skyke",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
