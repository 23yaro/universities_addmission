import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: homeScreenMenu,
        ),
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
    return Column(children: [

      Card(
        child: ListTile(
          leading: leadingIcon,
          title: Text(titleText),
          trailing: IconButton(
            onPressed: () => Navigator.pushNamed(context, routName),
            icon: const Icon(Icons.navigate_next),
          ),
        ),
      ),
    ]);
  }
}

const List<Widget> homeScreenMenu = [
  SizedBox(height: 25,),
  SizedBox(height: 100,child: Text('Здравствуйте, вы можете воспользоваться следующими сервисами',style: TextStyle(fontSize: 24),)),
  SizedBox(height: 25,),
  HomeCard(
    titleText: 'Подать документы',
    leadingIcon: Icon(Icons.library_books),
    routName: '/home_screen/docs',
  ),
  SizedBox(height: 20,),
  HomeCard(
    titleText: 'Ранжированные списки',
    leadingIcon: Icon(Icons.list_alt),
    routName: '/home_screen/list',
  ),
  SizedBox(height: 20,),
  HomeCard(
    titleText: 'Задать вопрос',
    leadingIcon: Icon(Icons.question_mark),
    routName: '/home_screen/question',
  ),
];
