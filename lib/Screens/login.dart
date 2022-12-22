// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshbasket/Screens/animation_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rive/rive.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'Language.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  bool showloding=false;
  late String email, password;
  Artboard? riveArtboard;
  //بدي اعمل كونترولير لكل الستيتس اللي موجودة بصفحة ال enum
  late RiveAnimationController controllerIdle;
  // late RiveAnimationController controllerlook_idle;
  late RiveAnimationController controllerLook_down_left;
  late RiveAnimationController controllerHands_up;
  late RiveAnimationController controllerhands_down;
  late RiveAnimationController controllersuccess;
  late RiveAnimationController controllerfail;
  late RiveAnimationController controllerLook_down_right;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isLookingRight = false;
  bool isLookingleft = false;
  String testEmail = "shorouq@gmail.com";
  String testPassword = "2468";
  final passwordFocusNode = FocusNode();

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerLook_down_left);
    riveArtboard?.artboard.removeController(controllerHands_up);
    riveArtboard?.artboard.removeController(controllerhands_down);
    riveArtboard?.artboard.removeController(controllerLook_down_right);
    riveArtboard?.artboard.removeController(controllerfail);
    riveArtboard?.artboard.removeController(controllersuccess);
    isLookingRight = false;
    isLookingleft = false;
  }

  void addidleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint("id less");
  }

  void addLookDouneLeftController() {
    isLookingleft = true;
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerLook_down_left);
    debugPrint("left");
  }

  void addhandsUpController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHands_up);
    debugPrint("handsup");
  }

  void addhandsDouwnController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerhands_down);
    debugPrint("handdown");
  }

  void addSuccessController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllersuccess);
    debugPrint("success");
  }

  void addFailController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerfail);
    debugPrint("fail");
  }

  void addlookdownRightController() {
    removeAllControllers();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLook_down_right);
    debugPrint("down");
  }

  void checkforPasswordFocuseNodeTochangeAnomationState() {
    passwordFocusNode.addListener(() {
      //اذا هو واقف على الباسوورد
      if (passwordFocusNode.hasFocus) {
        addhandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        addhandsDouwnController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHands_up = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerLook_down_left =
        SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerLook_down_right =
        SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerhands_down = SimpleAnimation(AnimationEnum.hands_down.name);
    controllersuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerfail = SimpleAnimation(AnimationEnum.fail.name);
    //بدي اعمل لود للانيميشن من ال image
    //هاي اللي ماسكة لب assest اللي عندي كلها
    rootBundle.load("image/login_animation.riv").then((data) {
      //مسكت فايل الانيميشن وحكيتو داخل الاوبجيكت اللي اسمه file
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      //هاذ الكود بيوضح الحالة الافتراضية اللي رح ابدأفيها

      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });
    checkforPasswordFocuseNodeTochangeAnomationState();
  }

  void validationPaasword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formkey.currentState!.validate()) {
        addSuccessController();
      } else {
        addFailController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 102, 25),
        title: const Text("Login Page"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showloding,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 20,
              ),
              child: Column(
                children: [
                  // بس بدي اعمل لود للانيميشن
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: riveArtboard == null
                          ? const SizedBox.shrink()
                          : Rive(artboard: riveArtboard!)),
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              email = value;
                              //اذا الحروف اللي كتبها اليوزر اقل من 16 بينظر لليسار
                              // isLookingleft داخل الشرط رح يضل يوح على فنكشن ال addleft في كل مرة اليوزر بيكتب فيها اشي لوما كتبت
                              if (value.isNotEmpty &&
                                  value.length < 16 &&
                                  !isLookingleft) {
                                addLookDouneLeftController();
                              } else if (value.isNotEmpty &&
                                  value.length > 16 &&
                                  !isLookingRight) {
                                addlookdownRightController();
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                            validator: ((value) =>
                                value != testEmail ? "Wrong Email" : null),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "PassWord",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                            focusNode: passwordFocusNode,
                            validator: ((value) =>
                                value != testPassword ? "password Email" : null),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 18,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width / 8,
                            ),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor:
                                        const Color.fromARGB(255, 22, 102, 25),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 14)),
                                onPressed: () async {
                                  setState(() {
                                    showloding=true;
                                  });
                                  try {
                                    final user =
                                        await _auth.signInWithEmailAndPassword(
                                            email: email, password: password);
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          anotherAnimation) {
                                        return const LanguageClass();
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
                                      showloding=false;
                                    });
                                  } catch (e) {
                                    print(e);
                                  }
      
                                  passwordFocusNode.unfocus();
                                  validationPaasword();
                                },
                                child: const Text(
                                  "LogIn",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          )
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
