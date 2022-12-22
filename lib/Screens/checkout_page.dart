
import 'package:flutter/material.dart';
// ignore: unnecessary_import
// import 'package:freshbasket/Screens/cridet_screen.dart';
import 'package:freshbasket/main.dart';
import 'package:provider/provider.dart';
// import 'cridet_screen.dart';

import 'cart.dart';
import 'package:freshbasket/Screens/cridet_screen.dart';


//شاشة تعرض الitem الموجوده بسلة المشريات التي قام الزبون بأختيارهم
class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();

}
class _CheckoutPageState extends State<CheckoutPage> {

  @override
  Widget build(BuildContext context){
    //لاستطيع ان اعمل acsess لل cart بأي مكان اريده
    return Consumer<Cart> (
      builder: (context ,cart,child){
        return Scaffold(
            appBar: AppBar(
              //اضافة ال$للسعر
              title: Text('your Cart[\$  ${cart.totalPrice}]'),
              backgroundColor: Colors.green,
              actions: [
                ElevatedButton(
              child: Text('pay'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardsScreen()));
          },
                ),
              ],

            ),
            //جملة شرط
            body: cart.basketItems.length== 0?
            Text('no items in your cart'):
            ListView.builder(
              itemCount: cart.basketItems.length,
              itemBuilder: (context,index){
                return Card(
                  child:ListTile(
                    title: Text(cart.basketItems[index].title),
                    //ضهور السعر بالyour shoppingcart screen
                    subtitle: Text(cart.basketItems[index].price.toString()),
                    //اضافة action delete
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        cart.remove(cart.basketItems[index]);

                      },
                    ),

                  ),
                );
              },


            )
        );
      },
    );
  }

}
