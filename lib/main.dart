import 'package:flutter/material.dart';
import 'package:seoul/screens/chat/screen_chatroom.dart';
import 'package:seoul/screens/community/screen_newPost.dart';
import 'package:seoul/screens/community/screen_post.dart';
import 'package:seoul/screens/mypage/set_info.dart';
import 'package:seoul/screens/screen_loading.dart';
import 'package:seoul/screens/screen_login.dart';
import 'package:seoul/screens/screen_map.dart';
import 'package:seoul/screens/signup/screen_welcome.dart';
import 'package:seoul/screens/signup/screen_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// https://port-0-backend-2aat2clv3zgzjz.sel5.cloudtype.app/

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      fontFamily: "Pretendard"
    ),
    routes: routes,
    home: newPostScreen(),
    );
  }
}

final routes = {
  ChatScreen.routeName: (context) => ChatScreen(),
  PostScreen.routeName: (context) => PostScreen(),

  SetInfo.routeName: (context) => SetInfo(),
};

// LoadingScreen
// LoginScreen
// MapScreen
// SignupScreen
// WelcomeScreen
// ChatScreen
