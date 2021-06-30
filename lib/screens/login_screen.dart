//import 'dart:ffi';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:videshot_app/screens/home_video_screen.dart';
import 'package:videshot_app/screens/numeric_pad.dart';
import 'package:videshot_app/screens/verify_phoneNo.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: Center(
        child: Text("Login Screen"),
      ),*/
      appBar: AppBar(
        title: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.7, 0.9],
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFF7F7F7),
                      ]
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 120,
                        child: Image.asset('assets/images/Logo1.png')
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 64),
                          child: Text(
                            "You'll receive a 4 digit code to verify your number.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF818181),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "Enter your mobile number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            phoneNumber,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)  =>  VerifyPhone(phoneNumber: phoneNumber,)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8B201),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
            NumericPad(
              onNumberSelected: (value){
                setState(() {
                  if(value != -1){
                    phoneNumber = phoneNumber + value.toString();
                  }
                  else{
                    phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
