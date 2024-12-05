import 'package:flutter/material.dart';

class Textscreen extends StatefulWidget {
  const Textscreen({super.key});

  @override
  State<Textscreen> createState() => _TextscreenState();
}

class _TextscreenState extends State<Textscreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add New Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              print('Title: ${_titleController.text}');
              print('Content: ${_contentController.text}');
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 93, 230, 98),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contentController,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
