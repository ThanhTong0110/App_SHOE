
import 'package:app_shoe/core/const.dart';
import 'package:app_shoe/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _pass = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _success;
  String _userEmail;

  @override
  void initState() {
    _email.text='';
    _pass.text='';
    super.initState();
  }


  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: 350,
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Image.asset('assets/1.png'),
              ),
            ),
//            Container(
//              margin: EdgeInsets.symmetric(horizontal: 20),
//              child: Column(
//                children: <Widget>[
//                  TextField(
//                    controller: _email,
//                    decoration: InputDecoration(
//                        hintText: 'Email',
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(15),
//                        )),
//                  ),
//                  SizedBox(height: 15),
//                  TextField(
//                    controller: _pass,
//                    obscureText: true,
//                    decoration: InputDecoration(
//                      hintText: 'Pass',
//                      border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(15),
//                      ),
//                    ),
//                  ),
//                  SizedBox(height: 50),
//                  Container(
//                    width: double.infinity,
//                    child: FlatButton(
//                      padding: EdgeInsets.symmetric(vertical: 15),
//                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                      child: Text('Login',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
//                      color: AppColors.yellowColor,
//                      onPressed: () {},
//                    ),
//                  ),
//                ],
//              ),
//            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _email,
                    validator: (String value){
                      if(value.isEmpty){
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),),

                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _pass,
                    obscureText: true,
                    validator: (String value){
                      if(value.isEmpty){
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Pass',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Text('SignIn',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      color: AppColors.yellowColor,
                      onPressed: () {
                        _signIn();
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Text('SignUp',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      color: AppColors.yellowColor,
                      onPressed: () {
                        _signUp();
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(_success==null?'':(_success?'Successfully register '+_userEmail:'Register failed')),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  final FirebaseAuth _auth=FirebaseAuth.instance;

  void _signUp() async{
    final FirebaseUser user=(await _auth.createUserWithEmailAndPassword(email: _email.text, password: _pass.text)).user;
    if(user !=null){
      setState(() {
        _success=true;
        _userEmail=user.email;
      });
    }
    else{
      setState(() {
        _success=false;
      });
    }
  }

  void _signIn() async{
    final FirebaseUser user=(await _auth.signInWithEmailAndPassword(email: _email.text, password: _pass.text)).user;
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomePage(user: user)));
  }
}


