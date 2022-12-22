// // ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:freshbasket/Screens/search_box.dart';

// import '../theam/theam_manager.dart';
// import 'nav_drawer.dart';
// // import 'package:sampleproject/product_card.dart';
// // import 'package:sampleproject/search_box.dart';
// // import 'drawer/nav_drawer.dart';
// // import 'models/prodect.dart';

// class HomeScreen extends StatefulWidget {
//   static String screenRoute = 'home_screen';
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// bool _iconbool = false;
// IconData _iconLighit = Icons.wb_sunny;
// IconData _iconDark = Icons.nights_stay;
// TheamManager _theamManager =TheamManager();



// class _HomeScreenState extends State<HomeScreen> {

//    @override
//   void dispose() {
//     _theamManager.removeListener(themeListine);
//     super.dispose();
//   }
//   @override
//   void initState() {
//     _theamManager.addListener(themeListine);
//     super.initState();
//   }
//   themeListine(){
//     if (mounted) {
//       setState(() {
        
//       });
      
//     }
//   }
//   Widget singleProduct() {
//     return Container(
     
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 5),
//         height: 230,
//         width: 160,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//                 flex: 2,
//                 child: Image.network(
//                   'https://i.cbc.ca/1.6471140.1653935142!/fileImage/httpImage/image.jpeg_gen/derivatives/16x9_780/ripe-red-strawberry-fruits.jpeg',
//                 )),
//             Expanded(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Strawberry',
//                       style: TextStyle(
//                           color: Colors.black, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       '1Kg',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       '\$3.99',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(7),
//                       decoration: BoxDecoration(
//                           color: Colors.green[200],
//                           borderRadius: BorderRadius.circular(50)),
//                       child: const Icon(
//                         Icons.add,
//                         size: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 248, 248, 248),
//       drawer: const NavigationDrawer(),
//       appBar: AppBar(
        
//         backgroundColor: Colors.green,
        
//         title: const Text(
//           'Basket App',
//           style: TextStyle(
//             color: Color.fromARGB(255, 255, 255, 255),
//           ),
//         ),
//         actions:  [
//           Padding(
//             padding: EdgeInsets.only(right: 20.0),
//             child: Icon(Icons.shopping_cart, color: Colors.white),
//           ),
//           Switch(value: _theamManager.themeMode == ThemeMode.dark, onChanged: (newVal){
             
//              _theamManager.toggleTheme(newVal);
//              setState(() {
               
//              });

//           })
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 17),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10.0),
//                     const Text(
//                       'Hi Hana',
//                       style: TextStyle(
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                     const SizedBox(height: 5.0),
//                     const Text(
//                       'Want to order fresh food?',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     SearchBox(),
//                     const SizedBox(height: 5.0),
//                     Container(
//                       height: 150,
//                       decoration: BoxDecoration(
//                         image: const DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(
//                               'https://images.pexels.com/photos/1152353/pexels-photo-1152353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
//                         ),
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 120, bottom: 10),
//                                   child: Container(
//                                     height: 50,
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white.withOpacity(0.3),
//                                       borderRadius: const BorderRadius.only(
//                                         bottomRight: Radius.circular(50),
//                                         bottomLeft: Radius.circular(50),
//                                       ),
//                                     ),
//                                     child: const Center(
//                                       child: Text(
//                                         'Fruit',
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                           color: Colors.red,
//                                           shadows: [
//                                             BoxShadow(
//                                                 color: Colors.red,
//                                                 blurRadius: 10,
//                                                 offset: Offset(0, 0))
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   '25% OFF',
//                                   style: TextStyle(
//                                     fontSize: 40,
//                                     color: Colors.green[200],
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   'SPECIAL OFFER',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.green[50],
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Text(
//                           'Categories',
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 17.0),
//                     Row(
//                       children: [
//                         const SizedBox(
//                           width: 25.0,
//                         ),
//                         Container(
//                             child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             CircleAvatar(
//                               radius: 45.0,
//                               backgroundImage: NetworkImage(
//                                   'https://cdn4.vectorstock.com/i/1000x1000/92/23/fruits-circle-icon-vector-17509223.jpg'),
//                               backgroundColor: Colors.green,
//                             ),
//                             SizedBox(
//                               height: 4.0,
//                             ),
//                             Text(
//                               "Fruits",
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 47, 47, 47),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         )),
//                         const SizedBox(
//                           width: 30.0,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             CircleAvatar(
//                                 radius: 45.0,
//                                 backgroundImage: NetworkImage(
//                                     'https://cdn1.vectorstock.com/i/1000x1000/25/85/carrots-vegetables-circle-icon-with-long-shadow-vector-7672585.jpg'),
//                                 backgroundColor: Colors.green),
//                             SizedBox(
//                               height: 4.0,
//                             ),
//                             Text(
//                               "Vegetables",
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 47, 47, 47),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 30.0,
//                         ),
//                         Container(
//                             child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             CircleAvatar(
//                                 radius: 45.0,
//                                 backgroundImage: NetworkImage(
//                                     'https://cdn3.vectorstock.com/i/1000x1000/84/32/herbal-medicine-logo-template-icon-vector-29518432.jpg'),
//                                 backgroundColor: Colors.green),
//                             SizedBox(
//                               height: 4.0,
//                             ),
//                             Text(
//                               "Herbs",
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 47, 47, 47),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         )),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text(
//                             'New Arrivals',
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'view all',
//                             style:
//                                 TextStyle(color: Colors.grey, fontSize: 17.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),

//                     /* ListView.builder(
//                     itemCount: products.length,
//                     itemBuilder: (context,index)=> ProductCard(
//                       itemIndex: index,
//                        product: products[index],

//                     ),
//                    ),

// */
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 5),
//                             height: 230,
//                             width: 160,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                       offset: Offset(0, 1),
//                                       blurRadius: 1,
//                                       color: Colors.black12),
//                                 ]),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Image.network(
//                                       'https://i.cbc.ca/1.6471140.1653935142!/fileImage/httpImage/image.jpeg_gen/derivatives/16x9_780/ripe-red-strawberry-fruits.jpeg',
//                                     )),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           'Strawberry',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           '1Kg',
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           '\$3.99',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(7),
//                                           decoration: BoxDecoration(
//                                               color: Colors.green[200],
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 5),
//                             height: 230,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Image.network(
//                                       'https://5.imimg.com/data5/LM/DU/MY-22954806/apple-fruit-500x500.jpg',
//                                     )),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           'Apple',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           '3Kg',
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           '\$4.59',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(7),
//                                           decoration: BoxDecoration(
//                                               color: Colors.green[200],
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 5),
//                             height: 230,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Image.network(
//                                         'https://5.imimg.com/data5/VR/LB/MY-58843567/organic-avocado-500x500.jpg')),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           'Avocado',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           '1.5Kg',
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           '\$5.99',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(7),
//                                           decoration: BoxDecoration(
//                                               color: Colors.green[200],
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 5),
//                             height: 230,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Image.network(
//                                       'https://i.cbc.ca/1.6471140.1653935142!/fileImage/httpImage/image.jpeg_gen/derivatives/16x9_780/ripe-red-strawberry-fruits.jpeg',
//                                     )),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           'Strawberry',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           '1Kg',
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           '\$3.99',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(7),
//                                           decoration: BoxDecoration(
//                                               color: Colors.green[200],
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 5),
//                             height: 230,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Image.network(
//                                       'https://i.cbc.ca/1.6471140.1653935142!/fileImage/httpImage/image.jpeg_gen/derivatives/16x9_780/ripe-red-strawberry-fruits.jpeg',
//                                     )),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           'Strawberry',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           '1Kg',
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           '\$3.99',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(7),
//                                           decoration: BoxDecoration(
//                                               color: Colors.green[200],
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text(
//                             'Daily needs',
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'view all',
//                             style:
//                                 TextStyle(color: Colors.grey, fontSize: 17.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10.0,
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 5),
//                             height: 230,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Image.network(
//                                       'https://t4.ftcdn.net/jpg/03/56/06/33/360_F_356063381_KEz0drp7FRC0qLl3GFg7nedpiIHCRj2c.jpg',
//                                     )),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           'Cucumber',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           '2Kg',
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           '\$1.59',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(7),
//                                           decoration: BoxDecoration(
//                                               color: Colors.green[200],
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 5),
//                             height: 230,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Image.network(
//                                       'https://newsthump.com/wp-content/uploads/2021/11/potatoes.jpg',
//                                     )),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           'potatoe',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           '2Kg',
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           '\$3.99',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(7),
//                                           decoration: BoxDecoration(
//                                               color: Colors.green[200],
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 5),
//                             height: 230,
//                             width: 160,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                     flex: 2,
//                                     child: Image.network(
//                                       'https://i.cbc.ca/1.6471140.1653935142!/fileImage/httpImage/image.jpeg_gen/derivatives/16x9_780/ripe-red-strawberry-fruits.jpeg',
//                                     )),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: const [
//                                         Text(
//                                           'Strawberry',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         Text(
//                                           '1Kg',
//                                           style: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10.0, vertical: 5.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text(
//                                           '\$3.99',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(7),
//                                           decoration: BoxDecoration(
//                                               color: Colors.green[200],
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: const Icon(
//                                             Icons.add,
//                                             size: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           singleProduct(),
//                           singleProduct(),
//                           singleProduct(),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
