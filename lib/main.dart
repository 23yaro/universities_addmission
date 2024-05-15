import 'package:flutter/material.dart';
import 'package:universities/screens/auth_screen/auth_screen.dart';
import 'package:universities/screens/docs_screen/docs_screen.dart';
import 'package:universities/screens/home_screen/home_screen.dart';

void main() {
  runApp(const UniversitiesApp());
}

class UniversitiesApp extends StatelessWidget {
  const UniversitiesApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Universities',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      routes: {
        '/auth':(context)=>  const AuthScreen(),
        '/home_screen':(context)=>const HomeScreen(),
        '/home_screen/docs': (context) => const DocsScreen(),
        '/home_screen/list': (context) => Container(),
        '/home_screen/question': (context) => Container(),
      },
      initialRoute: '/auth',
    );
  }
}

