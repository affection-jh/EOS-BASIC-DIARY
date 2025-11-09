import 'package:diary/data/diary.dart';
import 'package:flutter/material.dart';

class DiaryService extends ChangeNotifier {
  List<Diary> diaries = [];

  Future<void> loadAllDiaries() async {
    notifyListeners();
  }

  Future<void> updateDiary(String id, Diary newDiary) async {
    notifyListeners();
  }

  Future<void> createDiary(Diary diary) async {
    //Todo:
    //전달된 다이어리를 diaries에 추가
    //노티파이를 통해 뷰 갱신
  }

  Future<void> deleteDiary(String id) async {}
}
