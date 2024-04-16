import 'package:flutter/material.dart';
import 'package:seoul/screens/chat/screen_chatroom.dart';
import 'package:seoul/screens/community/screen_post.dart';
import 'package:seoul/screens/screen_loading.dart';
import 'package:seoul/screens/screen_login.dart';
import 'package:seoul/screens/screen_map.dart';
import 'package:seoul/screens/signup/screen_welcome.dart';
import 'package:seoul/screens/signup/screen_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    home: PostScreen()
    );
  }
}

final routes = {
  ChatScreen.routeName: (context) => ChatScreen(),
};

// LoadingScreen
// LoginScreen
// MapScreen
// SignupScreen
// WelcomeScreen
// ChatScreen
