import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController codeName = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  dispose(){
    codeName.dispose();
    password.dispose();
    super.dispose();

  }

  final String assetName = 'assets/logo.svg';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 143, 15, 1.0),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(
                    assetName,
                ),
                Text(
                    "Green Jar",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Roboto",
                  color: Colors.white,
                ),),
                Container(
                  margin: EdgeInsets.symmetric(
                        horizontal: 50
                    ),
                  child: TextField(
                    controller: codeName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      hintText: "Code name",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                      enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Colors.white, width: 1.0),
                        ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Colors.white
                        ),


                      ) ,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.white
                        ),


                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 50
                  ),
                  child: TextField(
                    controller: password,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                        enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Colors.white, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Colors.white
                          ),


                        ) ,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Colors.white
                          ),


                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: (){


                      
                      var bytes = utf8.encode(codeName.text); // data being hashed
                      var codeNameHash = sha1.convert(bytes);

                      var bytes_2 = utf8.encode(password.text); // data being hashed
                      var passwordHash = sha1.convert(bytes_2);


                      print("hash Code name: $codeNameHash");
                      print("Hash for Password: $passwordHash");

                      

                    },
                    child: Text(
                        "Sign In",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(1, 143, 15, 1.0)
                      ),
                    ),
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),

                        ))
                    
                  ),
                )
              ],
            ),
    ),
        ));
  }
}
