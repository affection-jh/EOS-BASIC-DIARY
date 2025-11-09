import 'package:diary/data/diary.dart';
import 'package:flutter/material.dart';

class DiaryService extends ChangeNotifier {
  List<Diary> diaries = [
    Diary(
      id: "1",
      title: "첫 일기",
      content: "세상이 억까하는 것 같다 그래도 힘내자",
      emotion: "예민",
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Diary(
      id: "2",
      title: "나의 골반이 멈추지 않는건",
      content: "오늘 에오스 때문일까?",
      emotion: "기쁨",
      createdAt: DateTime.now().subtract(Duration(days: 2)),
    ),
    Diary(
      id: "3",
      title: "하드코딩된 데이터",
      content: "이 데이터들은 하드코딩된 데이터 입니다!",
      emotion: "언짢음",
      createdAt: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  Future<void> loadAllDiaries() async {
    notifyListeners();
  }

  Future<void> updateDiary(String id, Diary newDiary) async {
    notifyListeners();
  }

  Future<void> createDiary(Diary diary) async {
    diaries.insert(0, diary);
    notifyListeners();
  }

  Future<void> deleteDiary(String id) async {}
}
