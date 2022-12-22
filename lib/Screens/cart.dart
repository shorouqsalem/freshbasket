import 'package:flutter/foundation.dart';

import 'item.dart';

//لاضافة ال provider اولا ننشأ ال changenotifierو اضافة notifylistener لارسال اشعارات واضافة notifierprovider على ال main
//  يوجد نوعان من notifierprovider هنا استعملت ال single يعني one class ثم اضيف ال consumer لعمل acsess لل cartو ال function التي بداخلها
class Cart extends ChangeNotifier{
  List<Item> _items =[];
  double _totalPrice =0.0;

  void add(Item item){
    _items.add(item);
    _totalPrice+=item.price;
    //هنا اذا حصل تغيير سيرسل اشعار للمكان الي فيه consumer
    notifyListeners();



  }
  void remove(Item item){
    _totalPrice-=item.price;
    _items.remove(item);
    notifyListeners();
  }
  //عدد العناصر
  int get count{
    return _items.length;
  }
  double get totalPrice{
    return _totalPrice;

  }
  List<Item> get basketItems{
    return _items;
  }


}