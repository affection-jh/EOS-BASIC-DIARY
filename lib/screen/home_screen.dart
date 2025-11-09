import 'package:diary/data/diary.dart';
import 'package:diary/screen/reading_screen.dart';
import 'package:diary/screen/writing_screen.dart';
import 'package:diary/service/diary_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final diaryService = context.watch<DiaryService>();
    final diaryCount = diaryService.diaries.length;

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
          if (diaryCount != 0) ...[
            ListView.builder(
              itemCount: diaryCount,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ReadingScreen(
                                  diary: diaryService.diaries[index],
                                ),
                          ),
                        );
                      },
                      child: DiaryCard(diaryService.diaries[index]),
                    ),
                  ),
            ),
          ],
          if (diaryCount == 0) ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.search_rounded, color: Colors.grey[600], size: 40),
                  Text(
                    "아직 일기가 없어요",
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
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

Widget DiaryCard(Diary diary) {
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
          child: Image.asset(diary.getEmotionImage(), width: 100, height: 100),
        ), // Positioned
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(diary.getFormattedDateTime()),
              Spacer(),
              Text(
                diary.getTitle(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ), // Text
              Text(
                diary.getContent(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ), // Text
            ],
          ), // Column
        ), // Padding
      ],
    ), // Stack
  ); // Container
}
