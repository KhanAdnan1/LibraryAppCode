import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import './forgotPass.dart';
import './login.dart';
class Profile extends StatefulWidget{
  final String stuName;
  final String userId;

  const Profile({Key ?key, required this.stuName, required this.userId}): super(key: key);

  @override
  _Profile createState()=> _Profile();
}

class _Profile extends State<Profile>{
  File? _image;
  Color textColor = Colors.black;
  Color cardColor = Colors.white;
  Color cardColor2 = Colors.white;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // void _removeImage() {
  //   setState(() {
  //     _image = null;
  //   });
  // }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top:50),

          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image != null
                  ? CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(_image!),
              )
                  : CircleAvatar(
                radius: 60,
                child: Icon(Icons.person, size: 60),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Photo'),
              ),
              //SizedBox(height: 20),
              // if (_image != null)
              //   ElevatedButton(
              //     onPressed: _removeImage,
              //     child: Text('Remove Photo'),
              //   ),
              // SizedBox(height: 20),
              //
              // Text(widget.stuName),
            ],
          ),
          ),
          Column(
            children: [
              Container(
                height: 75,
                width: 350,
                margin:  EdgeInsets.only(top: (MediaQuery.of(context).size.width / 50)),
                // decoration: BoxDecoration(
                //   color: Colors.yellow,
                // ),
                child: Card(
                  elevation: 8,
                  child:Container(
                    margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 8),top: (MediaQuery.of(context).size.width / 15)),
                  child:Text( 'Name: '+widget.stuName,style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                  )

                ),
              ),

              Container(
                height: 75,
                width: 350,
                margin:  EdgeInsets.only(top: (MediaQuery.of(context).size.width / 50)),
                // decoration: BoxDecoration(
                //   color: Colors.yellow,
                // ),
                child: Card(
                    elevation: 8,
                    child:Container(
                      margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 8),top: (MediaQuery.of(context).size.width / 15)),
                      child:Text( 'User Name: '+widget.userId,style:TextStyle(fontSize: 20,fontWeight:FontWeight.w600)),
                    )

                ),
              ),

              Container(
                height: 75,
                width: 350,
                margin: EdgeInsets.only(top: (MediaQuery.of(context).size.width / 50)),
                child: Card(
                    elevation: 8,
                    color: cardColor,
                    child:Container(
                      margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 8),top: (MediaQuery.of(context).size.width / 15)),
                      child:InkWell(
                        onTap: (){
                          setState(() {
                            textColor = Colors.white; // Change to your desired color
                            cardColor = Colors.blue ;
                          });
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));
                        },
                        child: Container(
                          child: Text('Change Password', style: TextStyle(fontSize: 20,color: textColor,fontWeight:FontWeight.w500)),
                        ),
                      )
                    )
                ),
              ),
              Container(
                height: 75,
                width: 350,
                margin: EdgeInsets.only(top: (MediaQuery.of(context).size.width / 50)),
                child: Card(
                    elevation: 8,
                    color: cardColor2,
                    child:Container(
                        margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 8),top: (MediaQuery.of(context).size.width / 15)),
                        child:InkWell(
                          onTap: (){
                            setState(() {
                              textColor = Colors.white; // Change to your desired color
                              cardColor2 = Colors.redAccent ;
                            });
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                          },
                          child: Container(
                            child: Text('Log Out', style: TextStyle(fontSize: 20,color: textColor,fontWeight:FontWeight.w400)),
                          ),
                        )
                    )
                ),
              )

            ],
          )
        ],

      )
    );
  }
}