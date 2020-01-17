import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  String email='';
  String password='';
  String uid;
  final _auth = FirebaseAuth.instance;
  //final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      email=value;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Email',
                    contentPadding: EdgeInsets.only(top: 4.0, left: 44.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      password=value;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'password',
                    contentPadding: EdgeInsets.only(top: 4.0, left: 44.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              RaisedButton(

                onPressed: () async{
                  try {
                    print('email:'+email+"   "+password);
                    final firebaseUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (firebaseUser != null) {
                      final currentFirebaseUser = await _auth.currentUser();
                      loggedInUser = currentFirebaseUser;
                      email = loggedInUser.email;
                      uid = loggedInUser.uid;
                      Navigator.pushNamed(context,'/homepage');
                      print(loggedInUser.email+' logged in!!');
                    }
                  } catch (e) {
                    print(e);
                  }

                },
                child: Text('Sign-Up'),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
