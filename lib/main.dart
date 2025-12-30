import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_market/core/routes.dart';

Future<void> main() async {
  // ۱. راه‌اندازی Flutter
  WidgetsFlutterBinding.ensureInitialized();
  
  // ۲. بارگذاری تنظیمات محیطی
  await dotenv.load(fileName: ".env");
  
  // ۳. تنظیم جهت متن فارسی (RTL)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // ۴. تنظیم UI سیستم
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  
  // ۵. اجرای برنامه
  runApp(const SmartMarketApp());
}

class SmartMarketApp extends StatelessWidget {
  const SmartMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بازار هوشمند',
      debugShowCheckedModeBanner: false,
      
      // تم برنامه
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Vazir',
        useMaterial3: true,
      ),
      
      // مسیرها
      initialRoute: AppRoutes.home,
      routes: AppRoutes.getRoutes(context),
      
      // تنظیمات محلی‌سازی
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', 'IR'), // فارسی
        Locale('en', 'US'), // انگلیسی
      ],
      locale: const Locale('fa', 'IR'),
      
      // تنظیمات RTL
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
