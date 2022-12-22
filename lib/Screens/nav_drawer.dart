import 'package:flutter/material.dart';
import 'package:freshbasket/Screens/maps.dart';

import '../main.dart';
import 'chat_screen.dart';
import 'checkout_page.dart';
import 'drawer_item.dart';

import 'my_profile.dart';
// import 'package:sampleproject/drawer/drawer_item.dart';
// import 'package:sampleproject/drawer/pages/chat_screen.dart';
// import 'package:sampleproject/drawer/pages/my_profile.dart';

// import '../home_screen.dart';

class NavigationDrawer extends StatelessWidget{
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Drawer(
    child: Material(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
        child: Column(
          children: [
            headerWidget(),
            const SizedBox(  height: 30 ),
            const Divider(thickness: 1,height: 10,color: Color.fromARGB(255, 255, 255, 255),),
            const SizedBox(  height: 30 ),

            DrawerItem(name: "My Profile", icon: Icons.account_box_rounded, onPressed: ()=> onItemPressed(context,index:0),),
             const SizedBox(  height: 30 ),
            DrawerItem(name: "Home", icon: Icons.home, onPressed: ()=> onItemPressed(context,index:1),),
            const SizedBox(  height: 30 ),

            DrawerItem(name: "My Orders", icon: Icons.shopping_cart, onPressed: ()=> onItemPressed(context,index:5),),
            const SizedBox(  height: 30 ),

             DrawerItem(name: "Map", icon: Icons.map, onPressed: ()=> onItemPressed(context,index:6),),
            const SizedBox(  height: 30 ),

            DrawerItem(name: "Chats", icon: Icons.message_outlined, onPressed: ()=> onItemPressed(context,index:4),),
            const SizedBox(  height: 30 ),

            DrawerItem(name: "Languages", icon: Icons.translate, onPressed: ()=> onItemPressed(context,index:0),),
            const SizedBox(  height: 30 ),

            DrawerItem(name: "Log out", icon: Icons.logout, onPressed: ()=> onItemPressed(context,index:0),),
            
          ],
        ),
      ),
    ),

   );
   
  }
  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);
    switch(index){

      case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyProfile()));
      break;
      
      case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeScreen()));
      break;

      case 4:
      Navigator.pushNamed(context, ChatScreen.screenRoute);
      break;

      case 5:
            Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));

      break;


      case 6:
      Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyMap()));
      break;
      
      default: Navigator.pop(context);
      break;
    }
  }

Widget headerWidget(){
  const url = 'https://cdn5.vectorstock.com/i/1000x1000/20/74/woman-avatar-profile-vector-21372074.jpg';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
       backgroundImage: NetworkImage(url),
       backgroundColor: Colors.white,
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Hana Baniissa', style: TextStyle(fontSize: 20, color: Colors.white), ),
              SizedBox(height: 4,),
                        Text('+926788871218', style: TextStyle(fontSize: 14, color: Colors.white), ),

            SizedBox(height: 1,),
          ],
        )
      ],
    );
}


}