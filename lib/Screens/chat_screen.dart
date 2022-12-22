// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String screenRoute='chat_screen';
  const ChatScreen({Key? key}) : super(key: key);


  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _firestore =FirebaseFirestore.instance;
  String? massageText; //give the message

//to get the messges
 /* void getMessages() async{
    final messages= await _firestore.collection('messages').get();

    for (var message in messages.docs){
      print(message.data());

    }  }*/


    void messagesStreams() async{
     await for (var snapshots in _firestore.collection('messages').snapshots()){
      for(var message in snapshots.docs){
        print(message.data());
      }
} }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: const [
            Text("My Chat"),
          ],
        ),
         elevation: 1,
    leading: IconButton(icon: const Icon(Icons.arrow_back,
    color: Color.fromARGB(255, 255, 255, 255),),
    onPressed: (){
      Navigator.pop(context);

    },),
        

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           // for full chat box
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context,snapshots){
                List<Text> messageWidgets=[];

                if(!snapshots.hasData){
                  //add here a spinner
                }
                        var data = snapshots.data;
                        final messages = data!.docs;

                  for(var message in messages){
                    // ignore: unused_local_variable
                    final messageText=message.get('text');
                    final messageSender=message.get('sender');
                    final messageWidget= Text('$massageText - $messageSender');
                    messageWidgets.add(messageWidget);
                  }
                
                return Column(
                  children: messageWidgets,
                );
              }
              
              ),
           //for boxbutton
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.green,
                    width: 2,
                  )
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                    onChanged: (value) {
                      massageText=value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      hintText: 'Send a message... ',
                      border: InputBorder.none
                    ),
                  )
                  ),
                 
                    GestureDetector(
                      onTap: (){
                         _firestore.collection('messages').add(
                        {
                          'text':massageText,
                          'sender':'hana@gmail',
                          //TOdo
                        //  'sender':signdInUser.email,
                        }
                      );

                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30),
                        ),
                       child:const Center(
                        child: Icon(Icons.send,
                        color: Colors.white,),
                      )
                      ),
                    )
                    
                   
                  
                ],
              ),
            )
          ],
        ),
      ),
    );  }
}