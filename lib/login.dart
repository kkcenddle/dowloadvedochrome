import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'home.dart';
import 'otp.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});



  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {


  @override
  void initState() {
    super.initState();
    disableScreenshots();
  }

  TextEditingController _controller = TextEditingController();

  Future<void> disableScreenshots() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Image.network(
              'https://media.licdn.com/dms/image/C4D0BAQF0C-ReRchnRA/company-logo_200_200/0/1631361123891?e=2147483647&v=beta&t=PI9-7ca8tJYvJSZFbgmJwkbBRzntqv7Yrlbautcq17Y',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 25,
            ),


            Center(
              child:  Text(
                "Phone Verification",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Text(
              "We need to register your phone without \n getting started!",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Phone Number',
                    prefix: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('+91 | ',style: TextStyle(fontSize: 18,color: Colors.black),),
                    ),
                  ),
                  // maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OTPScreen(_controller.text)));
                    },
                    child: Text("Send the code")),
              ),
            ),


          ],
        ),
      ),
    );
  }
}





