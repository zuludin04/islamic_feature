class Dzikir {
  Dzikir({
    this.id,
    this.arabic,
    this.arabicLatin,
    this.faedah,
    this.narrator,
    this.note,
    this.title,
    this.translatedId,
    this.time,
  });

  Dzikir.fromJson(dynamic json) {
    id = json['id'];
    arabic = json['arabic'];
    arabicLatin = json['arabic_latin'];
    faedah = json['faedah'];
    narrator = json['narrator'];
    note = json['note'];
    title = json['title'];
    translatedId = json['translated_id'];
    time = json['time'];
  }

  int? id;
  String? arabic;
  String? arabicLatin;
  String? faedah;
  String? narrator;
  String? note;
  String? title;
  String? translatedId;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['arabic'] = arabic;
    map['arabic_latin'] = arabicLatin;
    map['faedah'] = faedah;
    map['narrator'] = narrator;
    map['note'] = note;
    map['title'] = title;
    map['translated_id'] = translatedId;
    map['time'] = time;
    return map;
  }
}
