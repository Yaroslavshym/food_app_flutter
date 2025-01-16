import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_flutter/features/welcome/presentation/pages/welcome_page.dart';

import 'firebase_options.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  TextStyle textStyle = TextStyle();
  textStyle = textStyle.copyWith();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        initialRoute: '/welcome/welcome_page',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/welcome/welcome_page':
              final args = settings.arguments as Map<String, dynamic>?;
              final bool isNull = args == null;
              return MaterialPageRoute(
                  builder: (_) => WelcomePage(
                        pageNumber: isNull ? 1 : args['pageNumber'],
                      ));
            default:
              return MaterialPageRoute(builder: (_) => WelcomePage());
          }
        },
      ),
    );
  }
}
