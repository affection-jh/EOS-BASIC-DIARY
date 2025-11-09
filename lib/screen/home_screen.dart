import 'package:diary/screen/writing_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text("에오스 일기장"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              print("로그아웃");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Stack(
        children: [
          //todo:
          //diaryService의존성 주입받기
          //diaryService의 diaries 값을 사용하여 ListView.builder 수정하기.
          ListView.builder(
            itemCount: 3,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      print("일기보기 화면으로 이동");
                    },
                    child: DiaryCard(),
                  ),
                ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WritingScreen()),
                  );
                },
                icon: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Todo:
//파라미터로 일기 객체 받기
//하드코딩된, title, content, emotion, createdAt 대신 일기 객체의 값과 메서드 사용

Widget DiaryCard() {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(10),
    ), // BoxDecoration
    child: Stack(
      children: [
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset("assets/images/기쁨.png", width: 100, height: 100),
        ), // Positioned
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("2025-01-01"),
              Spacer(),
              Text(
                "이것은 제목입니다.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ), // Text
              Text(
                "이것은 내용입니다.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ), // Text
            ],
          ), // Column
        ), // Padding
      ],
    ), // Stack
  ); // Container
}
