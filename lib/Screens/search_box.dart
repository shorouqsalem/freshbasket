import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget{
  const SearchBox({super.key});

  @override
  Widget build(Object context) {
   return Padding(padding: const EdgeInsets.only(
    left: 3.0,
    right: 3.0,
    bottom: 10.0

   ),
   child: Material(
    elevation: 10.0,
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    child: const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 15.0
        ),
        hintText: 'Search here....',
        suffixIcon: Icon(
          Icons.search_rounded,
          size: 25,
          color: Colors.green,

        ),
      ),
    ),
   ),
   );
  

}}