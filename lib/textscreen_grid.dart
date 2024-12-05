import 'package:flutter/material.dart';

class Textscreen_grid extends StatefulWidget{
  @override
  State<Textscreen_grid> createState()=> _Textscreen_gridState();
}

class _Textscreen_gridState  extends State<Textscreen_grid>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Padding(padding: 
      EdgeInsets.all(15.0),
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 2),

       itemBuilder: (context,index){
      return Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.pink,
          
        ),
        child: Padding(padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(""),
            Text(""),
          ],
        ),
        ),
      );
       }),
      ),
      ),
    );
  }
}