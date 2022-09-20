class AsmaulHusna {
  int? urutan;
  String? latin;
  String? arab;
  String? arti;

  AsmaulHusna({
    this.urutan,
    this.latin,
    this.arab,
    this.arti,
  });

  AsmaulHusna.fromJson(dynamic json) {
    urutan = json['urutan'];
    latin = json['latin'];
    arab = json['arab'];
    arti = json['arti'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['urutan'] = urutan;
    map['latin'] = latin;
    map['arab'] = arab;
    map['arti'] = arti;
    return map;
  }
}
