
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focuslist/screens/startpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  bool isObscured = true;
  // String email = '';
  // String pass = '';

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
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
                'Register Here',
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
              child: TextField(
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
              child: TextField(
                controller: passwordController,
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
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Login page",
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
                        .createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
                    );
                    setState(() {
                      loading = true;
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => start_page()));
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      loading = false;
                      print(e.toString());
                    });
                    //Utils().toastmessage(e.toString());
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // Center(
            //   child: RoundButton(
            //     title:"Create",
            //     onTap: () async {
            //       try {
            //         final credential = await FirebaseAuth.instance
            //             .createUserWithEmailAndPassword(
            //           email: emailController.text.toString(),
            //           password: passwordController.text.toString(),
            //         );
            //         setState(() {
            //           loading = true;
            //         });
            //         Navigator.pushNamed(context, 'home');
            //       } on FirebaseAuthException catch (e) {
            //         setState(() {
            //           loading = false;
            //         });
            //         Utils().toastmessage(e.toString());
            //       } catch (e) {
            //         print(e);
            //       }
            //     },

            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
