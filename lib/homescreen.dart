import 'package:echo_note/appwriteservice.dart';
import 'package:echo_note/listScreen.dart';
import 'package:echo_note/listscreen_grid.dart';
import 'package:echo_note/taskscreen.dart';
import 'package:echo_note/taskscreen_grid.dart';
import 'package:echo_note/textscreen.dart';
import 'package:echo_note/textscreen_grid.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late AppwriteService _appwriteService;
  final _titlecontroller = TextEditingController();
  final _contentcontroller = TextEditingController();
  bool isFABVisible = true;

  // Flags to manage grid visibility
  bool showTextGrid = false;
  bool showListGrid = false;
  bool showTaskGrid = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 234, 16),
          title: Text(
            "Echo Note",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Text'),
              Tab(text: 'List'),
              Tab(text: 'Task'),
            ],
          ),
        ),
        floatingActionButton: isFABVisible
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    isFABVisible = false;
                  });
                },
                backgroundColor: const Color.fromARGB(255, 9, 234, 16),
                child: Text(
                  "+",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        body: Stack(
          children: [
            // Use the flag to show the correct grid
            if (showTextGrid) Textscreen_grid(),
            if (showTaskGrid) TaskScreen_grid(),
            if (showListGrid) ListScreen_grid(),

            // FAB controls for navigation to add tasks, lists, and text
            if (!isFABVisible)
              Positioned(
                right: 10,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Taskscreen()),
                        ).then((_) {
                          setState(() {
                            showTaskGrid = true;
                          });
                        });
                      },
                      mini: true,
                      backgroundColor: const Color.fromARGB(255, 9, 234, 16),
                      child: Icon(Icons.add_task),
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Listscreen()),
                        ).then((_) {
                          setState(() {
                            showListGrid = true;
                          });
                        });
                      },
                      mini: true,
                      backgroundColor: const Color.fromARGB(255, 9, 234, 16),
                      child: Icon(Icons.check_box),
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Textscreen()),
                        ).then((_) {
                          setState(() {
                            showTextGrid = true;
                          });
                        });
                      },
                      backgroundColor: const Color.fromARGB(255, 9, 234, 16),
                      child: Icon(Icons.notes),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
