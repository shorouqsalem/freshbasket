// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unnecessary_string_interpolations, deprecated_member_use

import 'dart:math';
import 'dart:io';
import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool showPassword = false;
  late Reference ref;
  late File file;
  var imgeUrl;
  // ignore: non_constant_identifier_names
  var imagepiker = ImagePicker();
  // UploadImage() async {
  //   var imagepiked = await imagepiker.getImage(source: ImageSource.camera);
  // }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1,
        // ignore: prefer_const_constructors
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                "My Profile",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.green),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(context);
                      },
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  //"${imageUrl}";
                                  "https://cdn5.vectorstock.com/i/1000x1000/20/74/woman-avatar-profile-vector-21372074.jpg",
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildTextField("Full Name", "Hana Baniissa", false),
              buildTextField("Email", "hanabaniissa@gmail.com", false),
              buildTextField("password", "****", true),
              buildTextField("Phone", "+96788758957", false),
              buildTextField("location", "Jordan-Amman", false),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // RaisedButton(
                    //   padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20)),
                    //   onPressed: () {},
                    //   color: Colors.black,
                    //   child: const Text("CANCEL",
                    //       style: TextStyle(
                    //           fontSize: 18,
                    //           letterSpacing: 2.2,
                    //           color: Color.fromARGB(255, 255, 252, 252))),
                    // ),
                    //  RaisedButton(
                    //             onPressed: () {},
                    //             color: Colors.green,
                    //             padding: EdgeInsets.symmetric(horizontal: 53,vertical: 15),
                    //             elevation: 2,
                    //             shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(20)),
                    //             child: Text(
                    //               "SAVE",
                    //               style: TextStyle(
                    //                   fontSize: 18,
                    //                   letterSpacing: 2.2,
                    //                   color: Colors.white),), )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.green,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green)),
      ),
    );
  }

  showBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Please Choose Image",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await ImagePicker()
                        .getImage(source: ImageSource.gallery);
                    if (picked != null) {
                      file = File(picked.path);
                      var rand = Random().nextInt(100000);
                      var imagename = "$rand${basename(picked.path)}";

                      var ref = FirebaseStorage.instance
                          .ref("images")
                          .child("$imagename");
                      await ref.putFile(file);
                      imgeUrl = await ref.getDownloadURL();

                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.photo_outlined,
                            size: 30,
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            "From Gallery",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await ImagePicker()
                        .getImage(source: ImageSource.camera);
                    if (picked != null) {
                      file = File(picked.path);
                      var rand = Random().nextInt(100000);
                      var imagename = "$rand${basename(picked.path)}";
                      ref = FirebaseStorage.instance
                          .ref("images")
                          .child("$imagename");

                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "From Camera",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )),
                ),
              ],
            ),
          );
        });
  }
}
