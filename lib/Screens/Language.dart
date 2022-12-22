// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freshbasket/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'maps.dart';
import 'signUp.dart';

class LanguageClass extends StatefulWidget {
  const LanguageClass({super.key});

  @override
  State<LanguageClass> createState() => _LanguageClassState();
}

class _LanguageClassState extends State<LanguageClass> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  "image/logo-removebg-preview.png",
                  fit: BoxFit.fill,
                ),

                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      //Button for English
                      child: ElevatedButton(
                        onPressed: () {
                          MyApp.of(context)!.setLocale(
                              const Locale.fromSubtags(languageCode: 'en'));

                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, anotherAnimation) {
                              return const MyMap();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellowAccent),
                        child: Text(
                          AppLocalizations.of(context)!.language,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //Button For Arabic
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        MyApp.of(context)!.setLocale(
                            const Locale.fromSubtags(languageCode: 'ar'));
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation, anotherAnimation) {
                            return const MyMap();
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
                        "عربي",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                      ),
                    ),
                  ),
                ),

                //fooookas ... important
                const SizedBox(
                  height: 25,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation, anotherAnimation) {
                            return const SignUp();
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
                        "LogOut",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
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
    );
  }
}
