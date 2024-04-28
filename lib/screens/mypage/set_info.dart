import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetInfo extends StatefulWidget {
  const SetInfo({super.key});

  static String routeName = "/set_info";

  @override
  State<SetInfo> createState() => _SetInfoState();
}


class _SetInfoState extends State<SetInfo> {
  final _authentication = FirebaseAuth.instance;
  final _controller = TextEditingController();
  var _userEnterNickname = '';

  void _modifyInfo(){
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('user').add({
      'nickname' : _userEnterNickname,
      'userID' : user!.uid,
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('내 정보 수정하기',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (value){
              setState(() {
                _userEnterNickname = value;
              });
            },
            decoration: InputDecoration(
              hintText: '닉네임 ㄱㄱ',
            ),
          ),
          TextButton(
            onPressed: (){
              _authentication.signOut();
            },
            child: Text('로그아웃')
          )
        ],
      ),
    );
  }
}
