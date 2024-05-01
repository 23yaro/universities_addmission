import 'package:flutter/material.dart';
import 'package:universities/screens/docs_screen/docs_screen.dart';
import 'package:universities/screens/home_screen/home_screen.dart';

void main() {
  runApp(const UniversitiesApp());
}

class UniversitiesApp extends StatelessWidget {
  const UniversitiesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Universities',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home_screen':(context)=>const HomeScreen(),
        '/home_screen/docs': (context) => DocsScreen(),
        '/home_screen/list': (context) => Container(),
        '/home_screen/question': (context) => Container(),
      },
      initialRoute: '/home_screen',
    );
  }
}

