import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';


class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {


  bool _isLoader = false;
  var category;
  bool _isLoading = true;
  String? userid;
  var profilepage;


  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child:Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.grey.shade500
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                      radius: 40.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("krish",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25.0
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text('krishnakumarkreatives@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              ExpansionTile(
                title: Text("Account"),
                leading: Icon(Icons.account_balance), //add icon
                childrenPadding: EdgeInsets.only(left:60), //children padding
                children: [

                  ListTile(
                    title: Text("Logout"),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Loginscreen()),
                              (route) => false);
                      print('Logout');

                    },
                  ),

                  //more child menu
                ],
              ),
            ],
          )
      ),
    );
  }
}




