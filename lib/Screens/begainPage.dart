// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:freshbasket/Screens/maps.dart';
import 'package:freshbasket/widget/build_images.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Begain extends StatefulWidget {
  const Begain({super.key});

  @override
  State<Begain> createState() => _BegainState();
}

class _BegainState extends State<Begain> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'fresh',
          body: 'vegetable and frouit is importent',
          image: const BuildImages(
              image:
                  'https://th.bing.com/th/id/OIP.nh-AIDK0NWNQJhB4zEpNwwAAAA?pid=ImgDet&w=288&h=254&rs=1'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'fresh',
          
          body: 'vegetable and frouit is importent',
          image: const BuildImages(
              image:
                  'https://img.freepik.com/free-vector/digital-translator-abstract-concept-illustration_335657-3769.jpg?w=740&t=st=1668277329~exp=1668277929~hmac=fdb53bb3657823b7f76de0184816506f1ac2689873a3c92c46c536ea878f8674'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'fresh',
          body: 'vegetable and frouit is importent',
          image: const BuildImages(
              image:
                  'https://blog.cdphp.com/wp-content/uploads/2020/05/delivery.png'),
          decoration: getPageDecoration(),
          footer: ElevatedButton(onPressed: () {}, child: const Text("home")),
        ),
      ],
//هاي الدن مهمة بدونها بيعطيني خطا وهي عشان احكي للكود انه ابدا
      done: const Text(
        'start',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onDone: () {
        goTohome(context);
      },
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      //سكيب بتوديني مباشرة لاخر صفحة
      skip: const Text('Skip'),
      //هون انا بحدد لليوزر شو رح يعمل لما يكبس على ال سكيب لانه الوضع الافترضي انه بيوديني على اخر صورة
      onSkip: () {
        goTohome(context);
      },
      nextFlex: 0,
      skipOrBackFlex: 0,
      // كل ما رفعت الرقم كل ما صارت ابطألانه بيشتغل بال ميلي سكند
      animationDuration: 500,
      dotsDecorator: getDotDecoraton(),

    );
  }

//للتحكم في شكل محويات الصفحة
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(
        fontSize: 28,
      ),
      imagePadding: EdgeInsets.all(24),
      titlePadding: EdgeInsets.zero,
      bodyPadding: EdgeInsets.all(20),
      pageColor: Colors.white,
    );
  }

  //للتحكم في شكل النقاط اللي تحت
  DotsDecorator getDotDecoraton() {
    return DotsDecorator(
        color: Colors.grey,
        //بالنسبة للاقواس من اليمين الطول واليسار العرض
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeColor: Colors.green,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  }

  void goTohome(context) {
    //pushReplacementعشان يعرض الصفحة مرة وحدة وما يرجعلها مر ثانية
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyMap()));
  }
}
//هاي التليمة رح تخفي كل الدوت
      //isProgress: false,
      //عشان اوقف التنقل بين الشاشات
      // freeze: true,
      //اذا من خلا صفحة معينة بدي اعمل اشي مثلا بدي اظهر رسالة
      //onChange: (index){},