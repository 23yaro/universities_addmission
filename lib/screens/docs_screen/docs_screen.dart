import 'package:flutter/material.dart';

class DocsScreen extends StatelessWidget {
  const DocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          GroupWidget(
            groupName: 'Персональные данные',
            forms: personalData,
          )
        ],
      ),
    );
  }
}

class GroupWidget extends StatelessWidget {
  final String groupName;
  final List<String> forms;

  const GroupWidget({super.key, required this.groupName, required this.forms});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(groupName),
          Column(
            children: forms
                .map(
                  (e) => Card(
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(hintText: e,border: InputBorder.none),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

const List<String> personalData = ['Имя', 'Фамилия', 'Отчесвто'];
