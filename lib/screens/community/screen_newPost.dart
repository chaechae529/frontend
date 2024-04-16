import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class newPostScreen extends StatefulWidget {
  const newPostScreen({super.key});
  @override
  State<newPostScreen> createState() => _newPostScreen();
}

class _newPostScreen extends State<newPostScreen> {
  var _userEnterTitle = '';
  var _userEnterContent = '';

  void _NewPost(){
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('post').add({
      'title' : _userEnterTitle,
      'content' : _userEnterContent,
      'time' : Timestamp.now(),
      'userID' : user!.uid,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: TextField(
              onChanged: (value){
                setState(() {
                  _userEnterTitle = value;
                });
              },
              decoration: InputDecoration(
                hintText: '제목',
              ),
            ),
          ),
          Container(width: 300, height: 1,),
          Container(
            child: TextField(
              onChanged: (value){
                setState(() {
                  _userEnterContent = value;
                });
              },
              decoration: InputDecoration(
                hintText: '내용을 입력하세요.'
              ),
            ),
          ),
        ],
      ),
    );
  }
}


