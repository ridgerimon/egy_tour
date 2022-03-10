import 'package:egy_tour/layout/cubit/cubit.dart';
import 'package:egy_tour/layout/home_layout.dart';
import 'package:egy_tour/modules/maps/cubit/cubit.dart';
import 'package:egy_tour/modules/splash/splash_screen.dart';
import 'package:egy_tour/shared/components/constants.dart';
import 'package:egy_tour/shared/cubit/bloc_observer.dart';
import 'package:egy_tour/shared/cubit/cubit.dart';
import 'package:egy_tour/shared/cubit/states.dart';
import 'package:egy_tour/shared/network/local/cache_helper.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');

  Widget widget;
  uId = CacheHelper.getData(key: "uId");
  if (uId != null) {
    widget = HomeLayout();
  } else {
    widget = SplashScreen();
  }
  BlocOverrides.runZoned(
        () {
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => HomeLayoutAppCubit()..getUserData(),
        ),
        BlocProvider(
          create: (BuildContext context) => MapCubit()..getCurrentLocation()..checkPermission()..customMarker(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states){},
        builder: (context, states){
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: startWidget,
          );
        },
      ),
    );
  }
}
