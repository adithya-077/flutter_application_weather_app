import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/services/database.dart';
import 'package:flutter_application_weather_app/util/colors.dart';
import 'package:flutter_application_weather_app/util/custom_textinput.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController displaynameInput = TextEditingController();
  final TextEditingController dpUrlInput = TextEditingController();
  final TextEditingController displayCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  customTI(emailInput, 'Email'),
                  SizedBox(height: screenSize.height * 0.02),
                  customTI(passwordInput, 'Password'),
                  SizedBox(height: screenSize.height * 0.02),
                  customTI(displaynameInput, 'Display name'),
                  SizedBox(height: screenSize.height * 0.02),
                  customTI(displayCity, 'City'),
                  SizedBox(height: screenSize.height * 0.02),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailInput.text,
                                password: passwordInput.text);

                        await DatabaseService(uid: user?.uid).updateUserData(
                            dname: displaynameInput.text,
                            dpic: dpUrlInput.text,
                            dcity: displayCity.text);

                        setState(() {});
                      } catch (e) {
                        SnackBar(
                          content: Text(e.toString()),
                          duration: Duration(seconds: 1),
                        );
                      }
                    },
                    child: Text('SIGN UP'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
