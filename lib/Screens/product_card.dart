// import 'package:flutter/material.dart';

// //import 'models/prodect.dart';

// class ProductCard extends StatelessWidget {
//   const ProductCard ({
//     Key? key, required this.itemIndex, required this.product,
//   }) : super(key: key);

//   final int itemIndex;
//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return Container(

//       margin: EdgeInsets.symmetric(horizontal: 5),
//        height: 230,
//                       width: 160,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
                        
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow:[
//                           BoxShadow(
//                             offset: Offset(0,1),
//                             blurRadius: 1,
//                             color: Colors.black12
//                           ),
//                         ] 
                      
                        
//                       ),
//                       child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded( 
//                           flex:2, 
//                         child: Image.asset(product.image)
//                         ),
//                         Expanded(child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                             Text(product.title,
//                             style: TextStyle(
//                               color: Colors.black,
//                             fontWeight: FontWeight.bold),),

//                                 Text(product.weight,
//                             style: TextStyle(
//                               color: Colors.grey,
//                            ),),
                          
                          
//                           ],),
//                         ),
//                         ),

//                        Expanded(
//                          child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
//                            child: Row(
//                             mainAxisAlignment:MainAxisAlignment.spaceBetween,
                       
//                             children: [
//                               Text(product.price,
//                               style: TextStyle(color: Colors.black,
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.w700,),
//                               ),
//                              Container(padding: const EdgeInsets.all(7),
                                
//                                 decoration: BoxDecoration(
//                                 color: Colors.green[200],
//                                  boxShadow:[
//                           BoxShadow(
//                             offset: Offset(0,1),
//                             blurRadius: 1,
//                             color: Colors.black12
//                           ),
//                         ] ,
//                                 borderRadius: BorderRadius.circular(50)),
//                                 child: Icon(Icons.add, size: 20,color: Colors.white
//                                 ,),),
                       
//                             ],
//                            ),
//                          ),
//                        )
                       
                       
//                         ],
//                       ),
//                     );
//   }
// }