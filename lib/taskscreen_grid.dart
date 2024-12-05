import 'package:flutter/material.dart';

class TaskScreen_grid extends StatefulWidget{
  @override
  State<TaskScreen_grid> createState()=> _TaskScreen_gridState();
}
class  _TaskScreen_gridState  extends State<TaskScreen_grid>{
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
          color: Colors.blue,
          
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