
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focuslist/auth/register_page.dart';
import 'package:focuslist/screens/startpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscured = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  // String email = '';
  // String pass = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 0),
            ),
            Center(
              child: Text(
                'Welcome to App Dev',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: Text(
                'Login Here',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0,
                ),
              ]),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  prefixIconConstraints: BoxConstraints(minWidth: 50),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0,
                ),
              ]),
              child: TextFormField(
                controller: passwordController,
                obscureText: isObscured,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    icon: isObscured
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  prefixIconConstraints: BoxConstraints(minWidth: 50),
                ),
              ),
            ),

             SizedBox(
              height: kToolbarHeight,
              width: width * 0.7,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: ()  {
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: const Text(
                  "Register page",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            SizedBox(
              height: kToolbarHeight,
              width: width * 0.7,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString())
                        .then((value) {
                      // Utils().toastmessage(value.user!.email.toString());
                      setState(() {
                        loading = true;
                      });
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>start_page()));
                  } on FirebaseAuthException catch (e) {
                    debugPrint(e.toString());
                    // Utils().toastmessage(e.toString());
                    setState(() {
                      loading = false;
                    });
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // Center(
            //     child: RoundButton(
            //   title: 'Login',
            //   loading: loading,
            //   onTap: () async {
            //     try {
            //       final credential = await FirebaseAuth.instance
            //           .signInWithEmailAndPassword(
            //               email: emailController.text.toString(),
            //               password: passwordController.text.toString())
            //           .then((value) {
            //         Utils().toastmessage(value.user!.email.toString());
            //         setState(() {
            //           loading = true;
            //         });
            //       });

            //       Navigator.pushNamed(context, 'home');
            //     } on FirebaseAuthException catch (e) {
            //       debugPrint(e.toString());
            //       Utils().toastmessage(e.toString());
            //       setState(() {
            //         loading = false;
            //       });
            //     }
            //   },
            // )),
          ],
        ),
      ),
    );
  }
}
