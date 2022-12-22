
import 'package:flutter/material.dart';
// انشات ذا الكلاس لاني رح استخدم الصور الموجودة فيه في اكثر من مكان داخل التطبيق
class BuildImages extends StatelessWidget {
  const BuildImages({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return Image(image: NetworkImage(image),width: 350,);
  }
}