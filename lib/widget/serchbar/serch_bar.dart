import 'package:flutter/material.dart';

class MapSearchBar extends StatelessWidget {
  const MapSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336, height: 42,
      child: SearchBar(
        backgroundColor: MaterialStatePropertyAll(Color(0xffcfe6fb)),
        // shadowColor: MaterialStatePropertyAll(Colors.black),
        leading: Icon(Icons.search, size: 18,),
        hintText: "목적지를 입력하시오",
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 14,
          color: Color(0xff767676),
        ),),
        trailing: [
          IconButton(
            icon: const Icon(Icons.toggle_off_outlined),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
