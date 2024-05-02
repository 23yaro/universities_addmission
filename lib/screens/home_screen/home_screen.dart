import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
      ),
      body: ListView(
        children: homeScreenMenu,
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String titleText;
  final Icon leadingIcon;
  final String routName;

  const HomeCard({
    super.key,
    required this.titleText,
    required this.leadingIcon,
    required this.routName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: leadingIcon,
        title: Text(titleText),
        trailing: IconButton(
          onPressed: () => Navigator.pushNamed(context, routName),
          icon: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}

const List<Widget> homeScreenMenu = [
  HomeCard(
    titleText: 'Подать документы',
    leadingIcon: Icon(Icons.library_books),
    routName: '/home_screen/docs',
  ),
  HomeCard(
    titleText: 'Ранжированные списки',
    leadingIcon: Icon(Icons.list_alt),
    routName: '/home_screen/list',
  ),
  HomeCard(
    titleText: 'Задать вопрос',
    leadingIcon: Icon(Icons.question_mark),
    routName: '/home_screen/question',
  ),
  HomeCard(
    titleText: 'Vote Putin',
    leadingIcon: Icon(Icons.accessible_forward_sharp),
    routName: '',
  ),
];
