// ignore_for_file: file_names, use_build_context_synchronously, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  bool showLoading=false;

  late String email;
  late String password;
  late String userName;
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showLoading,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("image/background.jpeg"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset(
                    "image/logo-removebg-preview.png",
                    fit: BoxFit.fill,
                  ),
      
                  // BackgraoundImage(),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: const TextStyle(color: Colors.white),
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.length > 100) {
                          return "Email can't to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "Email can't to be less than 2 letter";
                        }
                        return null;
                      },
                      cursorColor: Colors.amberAccent,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: " Your Email",
                        hintStyle:
                            const TextStyle(fontSize: 14, color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 30),
                        label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: const Text(
                              "Email",
                              style: TextStyle(color: Colors.white),
                            )),
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      userName = value;
                    },
                    style: const TextStyle(color: Colors.white),
                    obscureText: false,
                    validator: (val) {
                      if (val!.length > 100) {
                        return "User Name can't to be larger than 100 letter";
                      }
                      if (val.length < 2) {
                        return "User Name can't to be less than 2 letter";
                      }
                      return null;
                    },
                    cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      hintText: " User Name",
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: const Text(
                            "User Name",
                            style: TextStyle(color: Colors.white),
                          )),
                      suffixIcon: const Icon(
                        Icons.person_add_alt_1_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
      
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    style: const TextStyle(color: Colors.white),
                    obscureText: isHiddenPassword,
                    validator: (val) {
                      if (val!.length > 100) {
                        return "Pass Word can't to be larger than 100 letter";
                      }
                      if (val.length < 2) {
                        return "Pass Word can't to be less than 8 letter";
                      }
                      return null;
                    },
                    cursorColor: Colors.amberAccent,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      hintText: " PassWord",
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: const Text(
                            "PassWord",
                            style: TextStyle(color: Colors.white),
                          )),
                      suffixIcon: InkWell(
                        onTap: _toasswordview,
                        child: (const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
      
                  const Spacer(),
      
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () async {
                          
                          setState(() {
                            showLoading=true;
                          });
                          //to validate user mae sign up
      
                          try {
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, anotherAnimation) {
                                return const Login();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ));
                            setState(() {
                              showLoading=false;
                            });
                          } 
                          catch (e) {
                            print(e);
                          }
      
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (context, animation, anotherAnimation) {
                              return const Login();
                            },
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellowAccent),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 60, 50, 46)),
                        ),
                      ),
                    ),
                  ),
      
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toasswordview() {
    //طريقة اخرى بدل جلة الشرط
    // isHiddenPassword=!isHiddenPassword
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = true;
    }
    setState(() {});
  }
}
