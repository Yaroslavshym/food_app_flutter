import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_app_flutter/features/auth/presentation/pages/auth_page.dart';
import 'package:food_app_flutter/features/welcome/presentation/pages/welcome_page.dart';
import 'package:window_size/window_size.dart';

import 'firebase_options.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (Platform.isMacOS) {
    setWindowTitle("My Flutter Desktop App");
    // // setWindowFrame(const Rect.fromLTWH(100, 0, 400, 800));
    setWindowMinSize(const Size(380, 800));
    setWindowMaxSize(const Size(380, 800));
  }
  if (Platform.isAndroid) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [
    //   SystemUiOverlay.top,
    //   SystemUiOverlay.bottom,
    // ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Top bar background
      statusBarIconBrightness: Brightness.dark, // Icon color: dark or light
      systemNavigationBarColor: Colors.black, // Bottom nav bar background
      systemNavigationBarIconBrightness: Brightness.light, // Icon color
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        // BlocProvider(
        //   create: (context) => AppBloc(),
        // )
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        child: MaterialApp(
          initialRoute: '/welcome/welcome_page',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/welcome/welcome_page':
                final args = settings.arguments as Map<String, dynamic>?;
                final bool isNull = args == null;
                return slideTransitionBuilder(
                  child: WelcomePage(
                    pageNumber: isNull ? 1 : args['pageNumber'],
                  ),
                  isNext: isNull ? true : args['isNext'] ?? true,
                );
              case '/auth/signin':
                return slideTransitionBuilder(child: LogInPage());
              default:
                return slideTransitionBuilder(child: WelcomePage());
            }
          },
        ),
      ),
    );
  }
}

PageRouteBuilder slideTransitionBuilder(
    {required Widget child, bool isNext = true}) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final _position = animation.drive(
          Tween<Offset>(
            begin: isNext ? const Offset(1, 0) : const Offset(-1, 0),
            end: Offset(0, 0),
          ),
        );

        return SlideTransition(position: _position, child: child);
      },
      transitionDuration: Duration(milliseconds: 100));

  // Additional transition options provided as comments:
  // left to right: begin: Offset(-1,0) end: Offset(0,0)
  // right to left: begin: Offset(1,0) end: Offset(0,0)
  // bottom to top: begin: Offset(0,1) end: Offset(0,0)
  // top to bottom: begin: Offset(0,-1) end: Offset(0,0)
  // from top right corner: begin: Offset(1,-1) end: Offset(0,0)
  // from bottom right corner: begin: Offset(1,1) end: Offset(0,0)
  // from top left corner: begin: Offset(-1,-1) end: Offset(0,0)
  // from bottom left corner: begin: Offset(-1,1) end: Offset(0,0)
}
