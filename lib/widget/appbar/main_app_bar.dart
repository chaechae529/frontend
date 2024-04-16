import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 0.5,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                },
              icon: Icon(Icons.notifications_none),
              iconSize: 30.0,
            ),

            SizedBox(width: 20,),

            Container(
              color: Color(0xffd9d9d9),
              width: 149,
              height: 32,
              alignment: Alignment.center,
              child: Text(
                '앱이름',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(width: 20,),

            IconButton(
              onPressed: () {
                Navigator.pop(context);
                },
              icon: Icon(Icons.favorite_border),
              iconSize: 30.0,
            ),
            SizedBox(
              width: 0.5,
            ),
          ],
        )
      ),
    );
  }
}
