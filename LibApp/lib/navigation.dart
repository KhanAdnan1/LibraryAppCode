import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './home.dart';
import './dashBoard.dart';
import './novels.dart';
import './profile.dart';

class Navigators extends StatefulWidget{
  final String className;
  final String stuName;
  final String userId;
  Navigators.withData({
    required this.className,
    required this.stuName,
    required this.userId,
  });
  //const Navigators({Key? key, required this.className, required this.stuName, required this.userId}) : super(key: key);
  @override
  _Navigators createState() => _Navigators();
}

class _Navigators  extends State<Navigators>{
  late List<Widget> bottomPage;

  void initState() {
    super.initState();
    bottomPage = [Home(), Dashboard(className: widget.className),Novel(),Profile(stuName: widget.stuName,userId:widget.userId)];
  }
  //final bottomPage=[Home(),Dashboard(className: widget.className),Novels(];
  int selectedItem=0;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child:bottomPage[selectedItem],
      ),
      bottomNavigationBar: Container(

        child:GNav(
          rippleColor:Colors.white,
          hoverColor: Colors.greenAccent,
          tabBorderRadius: 50,
          curve: Curves.linear,
          backgroundColor: Colors.blue.shade300,
          gap: 8,
          activeColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          tabBackgroundColor: Colors.blue[100]!,
          iconSize: 25,
          tabs: const[
            GButton(icon:Icons.home,text: 'Home',),
            GButton(icon:Icons.library_books ,text: 'Books'),
            GButton(icon:Icons.menu_book ,text: 'Novels'),
            GButton(icon:Icons.person ,text: 'Profile'),

          ],
          //currentIndex:selectedItem,
          onTabChange: (setValue){
            setState(() {
              selectedItem=setValue;
            });
          },
        ) ,
      )
    );
  }
}
