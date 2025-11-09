import 'package:diary/data/diary.dart';
import 'package:flutter/material.dart';

class ReadingScreen extends StatelessWidget {
  ReadingScreen({super.key, required this.diary});

  final Diary diary;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = diary.getTitle();
    contentController.text = diary.getContent();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(diary.getFormattedDateTime()),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/기쁨.png", width: 100, height: 100),
            TextField(
              readOnly: true,
              controller: titleController,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              decoration: InputDecoration(
                hintText: "제목을 입력하세요.",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),

                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
            TextField(
              readOnly: true,
              controller: contentController,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "본문을 입력하세요.",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),

                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
