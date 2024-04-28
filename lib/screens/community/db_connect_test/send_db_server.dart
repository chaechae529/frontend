import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:seoul/screens/community/screen_post.dart';

import '../../../models/model_board.dart';
import '../../../models/model_comment.dart';
import '../../../models/model_like.dart'; // 모델 위치 확인 필요


Future<void> saveNewPost(Board board) async {
  try {
    final response = await http.post(
      Uri.parse('https://port-0-backend-2aat2clv3zgzjz.sel5.cloudtype.app/boards/gold'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(board.toJson()),
    );
    if (response.statusCode != 201) {
      print("Error from server: ${response.body}");
      throw Exception("Failed to send data");
    } else {
      var decodedResponse = jsonDecode(response.body);
      var createdId = decodedResponse['id']; // 서버가 생성한 board id
      board.id = createdId; // 생성된 id를 로컬 Board 객체에 저장
      print("User Data sent successfully");
      Get.to(const PostScreen());
    }
  } catch (e) {
    print("Failed to send user data: ${e}");
  }
}

Future<void> saveNewComment(Comment comment, int boardId) async { //boardId 확인하기
  try {
    final response = await http.post(
      Uri.parse('https://port-0-backend-2aat2clv3zgzjz.sel5.cloudtype.app/comment/$boardId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(comment.toJson()),
    );
    if (response.statusCode != 201) {
      print("Error from server: ${response.body}");
      throw Exception("Failed to send data");
    } else {
      print("User Data sent successfully");
    }
  } catch (e) {
    print("Failed to send user data: ${e}");
  }
}

Future<void> addLike(Like like, int boardId) async { //boardId 확인하기
  try {
    final response = await http.post(
      Uri.parse('https://port-0-backend-2aat2clv3zgzjz.sel5.cloudtype.app/likes/add/$boardId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(like.toJson()),
    );
    if (response.statusCode != 201) {
      print("Error from server: ${response.body}");
      throw Exception("Failed to send data");
    } else {
      print("User Data sent successfully");
    }
  } catch (e) {
    print("Failed to send user data: ${e}");
  }
}



