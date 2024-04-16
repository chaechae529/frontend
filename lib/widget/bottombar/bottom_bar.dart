import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/chat/screen_chatroom.dart';


class BottomBar extends StatefulWidget {

  @override
  _BottomBar createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar>{
  int _selectedIndex = 0;
  final _authentication = FirebaseAuth.instance;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 인덱스를 업데이트하고 상태 변경을 알립니다.
    });
    switch(index){
      case 2:
        Navigator.pushReplacementNamed(
          context,
          ChatScreen.routeName,
        );

      case 3:
        _authentication.signOut();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 343, height: 82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.5,
              spreadRadius: 1.0,
              offset: Offset(
                  0,5
              ),
            )
          ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed type when having more than 3 items
          backgroundColor: Color(0xffcfe6fb),
          selectedItemColor: Color(0xffcfe6fb), // 선택된 아이템 색상
          unselectedItemColor: Colors.white, // 선택되지 않은 아이템 색상
          currentIndex: _selectedIndex, // 현재 선택된 탭 인덱스

          onTap: _onItemTapped,

          items: [
            for (int i = 0; i < 4; i++) // 4개의 아이템을 만듭니다.
              BottomNavigationBarItem(
                icon: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _selectedIndex == i ? Colors.white : Colors.transparent, // 현재 인덱스가 선택된 경우 흰색으로 설정합니다.
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _selectedIndex == i ? Colors.grey : Colors.transparent, // 현재 인덱스가 선택된 경우 흰색으로 설정합니다.
                        blurRadius: 2.5,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0,5
                        ),
                      )
                    ],
                  ),
                  child: Icon(
                    i == 0 ? Icons.home_outlined :
                    i == 1 ? Icons.chat_rounded :
                    i == 2 ? Icons.list :
                    Icons.account_circle, // i에 따라 다른 아이콘을 할당합니다.
                    size: 32,
                    color: _selectedIndex == i ? Color(0xffcfe6fb) : Colors.white, // 선택된 아이콘이면 primaryColor, 아니면 grey
                  ),
                ),
                label: '',
              ),
          ],
          showSelectedLabels: false, // 선택된 레이블을 숨깁니다.
          showUnselectedLabels: false, // 선택되지 않은 레이블을 숨깁니다.
        ),
      )
    );
  }
}
