import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seoul/screens/community/screen_newPost.dart';
import 'package:seoul/widget/bottombar/bottom_bar.dart';
import 'package:seoul/widget/post/post_content.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  static String routeName = "/screen_post";

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    // 카테고리를 예시로 'general'로 설정
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('실시간',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16
          ),
        ),
      ),
      body: Stack(
        children: [
          Content(),
          Positioned(
            bottom: 30, right: 25,
            child: Container(
              width: 65, height: 65,
              child: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => newPostScreen())
                  );
                },
                icon: Icon(
                  Icons.mode_edit_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff61abf1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.5,
                    spreadRadius: 1.0,
                    offset: Offset(
                        0,3
                    ),
                  ),
                ],
              ),
            ),
          ), //글쓰기 버튼
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
