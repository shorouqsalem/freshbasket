// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ratting extends StatelessWidget {
  const Ratting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ratting Bar change
            const Text("Dear user, please rate the application "),
            //لاختيار شكل التقييم
            RatingBar.builder(
                itemCount: 5,
                initialRating: 2,
                minRating: 1,
                //اني بفدر اقيم نص نجمة
                allowHalfRating: true,
                direction: Axis.horizontal,
                itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                // ignore: prefer_const_constructors
                itemBuilder: ((context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    )),
                //هي عبارة عن فنكشن وبعطيني دبل
                onRatingUpdate: (value) {}),
                const Text("select your face while using the app"),
            RatingBar.builder(
              initialRating: 3,
              itemCount: 5,
              itemBuilder: ((context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return const Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
              }),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        ),
      ),
    );
  }
}
