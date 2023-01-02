import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed/home_module/presentation/controller/home_cubit.dart';
import 'package:mohamed/login_module/presentation/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(
    const MyApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getRegion()
        ..getFillFilled()
        ..getUnFillFilled(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale(
            'ar',
            'AE',
          ),
        ],
        debugShowCheckedModeBanner: false,
        title: 'الحماية المدنية',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(
            0xFF3F4048,
          ),
          fontFamily: 'ElMessiri',
          primarySwatch: Colors.blueGrey,
          primaryColor: const Color(
            0xFF1C30E0,
          ),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
