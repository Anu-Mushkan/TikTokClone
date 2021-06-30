import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:js';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:videshot_app/screens/home_video_screen.dart';
import 'package:videshot_app/screens/numeric_pad.dart';

class VerifyPhone extends StatefulWidget {

  String user = "";
  final String phoneNumber;
  VerifyPhone({@required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  BuildContext context;
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black87,
          ),
        ),
        title: Text(
          "Verify phone number",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /*Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "Code is sent to " + widget.phoneNumber,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF818181),
                          ),
                        ),
                      ),*/
                      SizedBox(
                          height: 70,
                          child: Image.asset('assets/images/Logo1.png')
                      ),
                      Text(
                        "Enter OTP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF818181),
                        ),
                      ),
                      Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ""),
                              buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ""),
                              buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ""),
                              buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : ""),
                              buildCodeNumberBox(code.length > 4 ? code.substring(4, 5) : ""),
                              buildCodeNumberBox(code.length > 5 ? code.substring(5, 6) : ""),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
            ),
            NumericPad(
              onNumberSelected: (value){
                setState(() {
                  if(value != -1){
                    if(code.length < 6){
                      code = code + value.toString();
                    }
                  }
                  else{
                    code = code.substring(0, code.length - 1);
                  }
                });
                print(code);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Did not get OTP,",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF818181),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: (){
                      print("Resend the code to the user");
                    },
                    child: Text(
                      "resend?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
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
                padding: EdgeInsets.all(25),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => HomeScreen()),
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
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
            /*NumericPad(
                onNumberSelected: (value){
                  print(value);
                },
            ),*/
          ],
        ),
      ),
    );
  }
  Widget buildCodeNumberBox(String codeNumber){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
                Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 1,
                offset: Offset(0.0, 0.75),
              ),
            ]
          ),
          child: Center(
            child: GestureDetector(
              child: Text(
                codeNumber,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1F1F),
                ),
              ),
              onTap: () async{
                try{
                  await FirebaseAuth.instance.signInWithCredential(
                      PhoneAuthProvider.getCredential(
                          verificationId: _verificationCode, smsCode: code)).then((value) async{
                    if(value.user != null){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                    }
                  });
                }
                catch(e){
                  FocusScope.of(context).unfocus();
                  // ignore: deprecated_member_use
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('invalid OTP'),));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
 _verifyPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phoneNumber}',
      verificationCompleted: (AuthCredential credential) async{
        await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
         if(value.user != null){
           Navigator.pushAndRemoveUntil(context,
               MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
         }
        });
      },
      verificationFailed: (AuthException e){
       print(e.message);
      },
      codeSent: (String verificationId, [int resendToken]){
       setState(() {
         _verificationCode = verificationId;
       });
      },
      codeAutoRetrievalTimeout: (String verificationId){
        setState(() {
          _verificationCode = verificationId;
        });
      },
        timeout: Duration(seconds: 60)
    );
 }
 @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
