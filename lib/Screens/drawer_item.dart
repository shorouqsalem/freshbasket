import 'package:flutter/material.dart';
class DrawerItem extends StatelessWidget{
  const DrawerItem({Key? key, required this.name, required this.icon, required this.onPressed}) : super(key: key);



  final String name;
  final IconData icon;
  final Function() onPressed;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
              Icon( icon, size: 25, color: Colors.white, ),
              const SizedBox(width: 25,),
              Text(name,style: const TextStyle(fontSize: 17,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}