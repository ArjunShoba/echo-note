import 'package:flutter/material.dart';

class Listscreen extends StatefulWidget {
  const Listscreen({super.key});

  @override
  State<Listscreen> createState() => _ListscreenState();
}

class _ListscreenState extends State<Listscreen> {
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
        title: Text('Add New List'),
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
            // Title TextField
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
              decoration: InputDecoration(
                labelText: 'Add to List',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                 
                    print('Item Added: ${_contentController.text}');
                   
                    _contentController.clear();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}