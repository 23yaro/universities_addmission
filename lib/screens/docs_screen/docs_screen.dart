import 'package:flutter/material.dart';

class DocsScreen extends StatelessWidget {
  const DocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Map<String, List<String>> textData = {
      'Персональные данные': ['Имя', 'Фамилия', 'Отчесвто'],
      'Паспортные данные': ['Серия', 'Номер', 'Кем выдан'],
      'ВУЗ': ['Факультет', 'Направление', 'Форма обучения'],
    };

    const List<String> fileData = [
      'Заявление на поступление',
      'Медсправка',
      'Аттестат',
    ];

    List<Widget> textGroups = textData.entries
        .map(
          (e) => GroupWidget(
            groupName: e.key,
            children: e.value.map((e) => TextFormWidget(text: e)).toList(),
          ),
        )
        .toList();

    List<Widget> fileGroups =
        fileData.map((e) => FileFormWidget(text: e)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Документы'),
      ),
      body: ListView(
        children: [...textGroups, ...fileGroups],
      ),
    );
  }
}

class GroupWidget extends StatelessWidget {
  final String groupName;
  final List<Widget> children;

  const GroupWidget({
    super.key,
    required this.groupName,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(groupName)),
          Column(
            children: children,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class TextFormWidget extends StatelessWidget {
  final String text;

  const TextFormWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class FileFormWidget extends StatelessWidget {
  final String text;

  const FileFormWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(text),
            )),
            IconButton(
              icon: const Icon(Icons.upload),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
