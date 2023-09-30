import 'package:flutter/material.dart';
class Profile extends StatefulWidget{
  final String stuName;
  const Profile({Key ?key, required this.stuName}): super(key: key);

  @override
  _Profile createState()=> _Profile();
}

class _Profile extends State<Profile>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text(widget.stuName),
      ),
    );
  }
}