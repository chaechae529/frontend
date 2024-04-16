import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seoul/widget/chat/message_content.dart';
import 'package:seoul/widget/chat/message_send_bar.dart';
import '../../widget/appbar/main_app_bar.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static String routeName = "/screen_chatroom";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    final user = _authentication.currentUser;
    try {
      if (user != null) {
        loggedUser = user;
      }
    } catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize( // AppBar 클래스는 명시적으로 너비와 높이를 설정할 수 있는 PreferredSize 위젯을 상속 받는다.
          preferredSize: Size.fromHeight(60), // 앱바 높이 조절
          child: MainAppBar(), // 앱바 적용
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 700,
                  color: Color(0xffcfe6fb),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Messages(),
                ),
                NewMessage(),

              ],
            ),
          ],
        )
      ),
    );
  }
}

