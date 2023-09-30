import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './forgotPass.dart';
import './navigation.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final response = await http.post(
      //'http://192.168.193.107:5000/login'
      Uri.parse('http://192.168.162.107:5000/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'user': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      print(token);
      final className = data['className'];
      final stuName=data['stuName'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Navigators( className: className,stuName:stuName),
        ),
      );
    }  else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid credentials. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        Column(
          children: [
            Container(
              padding:EdgeInsets.only(top:50) ,

              child:
            Center(
              child:Card(
                  elevation: 15,
                  shadowColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),

                child:Column(
                  children:[
                    TextField(
                      style: TextStyle(),
                      controller: _usernameController,
                      decoration: InputDecoration(hintText: ' Username'),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(hintText: ' Password'),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                      },
                      child: Text('Forgot Password?',style:TextStyle(fontSize: 15,) ,),
                    )
                  ]
                )
              )
            )
            )
          ],
        ),
      )
    );
  }
}



