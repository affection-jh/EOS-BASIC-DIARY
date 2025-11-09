class Diary {
  String id;
  String title;
  String content;
  String emotion;
  DateTime createdAt;
  static Map<String, String> emotionImages = {
    "기쁨": "assets/images/기쁨.png",
    "당당함": "assets/images/당당함.png",
    "모름": "assets/images/모름.png",
    "배부름": "assets/images/배부름.png",
    "슬픔": "assets/images/슬픔.png",
    "언짢음": "assets/images/언짢음.png",
    "예민": "assets/images/예민.png",
    "졸림": "assets/images/졸림.png",
    "화남": "assets/images/화남.png",
  };

  Diary({
    required this.id,
    required this.title,
    required this.content,
    required this.emotion,
    required this.createdAt,
  });

  String getId() {
    return id;
  }

  String getTitle() {
    return title;
  }

  String getContent() {
    return content;
  }

  String getEmotionImage() {
    return emotionImages[emotion] ?? "assets/images/기쁨.png";
  }

  String getFormattedDateTime() {
    final year = createdAt.year;
    final month = createdAt.month.toString().padLeft(2, '0');
    final day = createdAt.day.toString().padLeft(2, '0');
    return "$year-$month-$day";
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "emotion": emotion,
      "createdAt": createdAt,
    };
  }

  Diary fromMap(Map<String, dynamic> data) {
    return Diary(
      id: id,
      title: title,
      content: content,
      emotion: emotion,
      createdAt: createdAt,
    );
  }
}
