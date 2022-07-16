import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/bottom/index.dart';
import 'package:flutter_demo/common/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 设置android状态栏为透明的沉浸
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutter学习',
      routes: routes,
      initialRoute: '/',
      // theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return const Color(0xff00a89b);
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return const Color(0xffffffff);
              },
            ),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (states) {
                return const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      home: const Index(),
    );
  }
}
