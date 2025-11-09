import 'package:diary/data/diary.dart';
import 'package:diary/service/diary_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class WritingScreen extends StatelessWidget {
  WritingScreen({super.key});

  final Diary diary = Diary(
    id: Uuid().v6(),
    title: "",
    content: "",
    createdAt: DateTime.now(),
    emotion: "기쁨",
  );

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          diary.getFormattedDateTime(),
          style: TextStyle(fontSize: 19),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (titleController.text.isEmpty ||
                  contentController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("제목과 본문을 모두 작성해주세요."),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              diary.title = titleController.text;
              diary.content = contentController.text;

              await context.read<DiaryService>().createDiary(diary);
              Navigator.pop(context);
            },
            child: Text(
              "등록하기",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/기쁨.png", width: 100, height: 100),
            TextField(
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
