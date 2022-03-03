import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

class NotificationService {
  static const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  static final NotificationService instance = NotificationService._internal();

  factory NotificationService() {
    return instance;
  }

  final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  final BehaviorSubject<ReceivedNotification> receiveSubject =
      BehaviorSubject<ReceivedNotification>();

  final BehaviorSubject<String?> selectSubject = BehaviorSubject<String?>();

  final InitializationSettings initialSetting =
      const InitializationSettings(android: androidSettings);

  late final NotificationAppLaunchDetails? appLaunchDetail;

  String? selectedPayload;

  NotificationService._internal();

  Future<void> init() async {
    print('========================');
    print("Init Notification local");
    print('========================');
    await _configureLocalTimeZone();
    appLaunchDetail = await plugin.getNotificationAppLaunchDetails();
    await plugin.initialize(initialSetting,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        print('notification payload: $payload');
      }
      selectedPayload = payload;
      selectSubject.add(payload);
    });
  }

  Future<void> _configureLocalTimeZone() async {
    print('========================');
    print("_configureLocalTimeZone");
    print('========================');
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  void configure(BuildContext currentContext) {
    requestPermissions();
    _configureReceiveSubject(currentContext);
    _configureSelectSubject();
  }

  void requestPermissions() {
    // request permissions IOS
    print('========================');
    print("Request permissions");
    print('========================');
    plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void _configureReceiveSubject(BuildContext parent) {
    print("---------------------------------");
    print("Start listen");
    print("---------------------------------");
    receiveSubject.stream.listen((event) async {
      print("---------------------------------");
      print("Listen Receive Notification Subject");
      print("---------------------------------");
      await showDialog(
          context: parent,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text(event.title ?? "Notification"),
                content: Text(event.body ?? "Notification Body"),
                actions: <Widget>[
                  CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () async {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text("OK"))
                ],
              ));
    });
  }

  void _configureSelectSubject() {
    print("---------------------------------");
    print("Start listen");
    print("---------------------------------");
    selectSubject.stream.listen((event) {
      print("---------------------------------");
      print('Listen Select Notification Payload!');
      print("---------------------------------");
    });
  }

  Future<void> zonedSchedule() async {
    print("---------------------------------");
    print('zonedSchedule');
    print("---------------------------------");
    await plugin.zonedSchedule(
      0,
      "Test Scheduled title",
      "Test Body Content",
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'Test channel id here', 'Test channel name',
              channelDescription: 'Test channel description')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showNotificationWithNoBody() async {
    print("---------------------------------");
    print('showNotificationWithNoBody');
    print("---------------------------------");
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await plugin.show(0, 'plain title', null, platformChannelSpecifics,
        payload: 'item x');
  }

  void dispose() {
    receiveSubject.close();
    selectSubject.close();
  }
}

class InfoValueString extends StatelessWidget {
  const InfoValueString({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  final String title;
  final Object? value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '$value',
              )
            ],
          ),
        ),
      );
}

class PaddedElevateButton extends StatelessWidget {
  const PaddedElevateButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      );
}
