// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/cubit.dart';
import 'package:social_app/layout/social_app_layout.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/shared/bloc_observer.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';

// for background notifications
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // ignore: avoid_print
  print('on background message');
  // ignore: avoid_print
  print(message.data.toString());
  // ignore: avoid_print
  showToast(text: 'on background message', state: ToastStates.SUCCESS);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var token = FirebaseMessaging.instance.getToken();
  // ignore: avoid_print
  print(token);
  FirebaseMessaging.onMessage.listen((event) {
    // ignore: avoid_print
    print('on message');
    // ignore: avoid_print
    print(event.data.toString());
    showToast(text: 'on message', state: ToastStates.SUCCESS);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    // ignore: avoid_print
    print(event.data.toString());
    showToast(text: 'on message opened app', state: ToastStates.SUCCESS);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  // token = CacheHelper.getData(key: 'uId');

  var uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key, this.isDark}) : super(key: key);

  final bool? isDark;
  final Widget? startWidget;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  MyApp({this.isDark, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => SocialCubit()
            ..getUserData()
            ..getPosts()
            ..getUserData(),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            // AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
