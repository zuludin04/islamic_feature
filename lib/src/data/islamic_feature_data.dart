import 'dart:convert';

import '../utils/parse_json.dart';
import 'model/asmaul_husna.dart';
import 'model/dzikir.dart';

Future<List<AsmaulHusna>> loadAsmaulHusnaData() async {
  String jsonString =
      await loadFromAssets('packages/islamic_feature/assets/asmaul_husna.json');
  List asmaulHusna = json.decode(jsonString);

  var asmaulHusnaList = <AsmaulHusna>[];

  for (var element in asmaulHusna) {
    AsmaulHusna asma = AsmaulHusna.fromJson(element);
    asmaulHusnaList.add(asma);
  }

  return asmaulHusnaList;
}

Future<List<Dzikir>> loadDzikirData(bool morning) async {
  String jsonString =
      await loadFromAssets('packages/islamic_feature/assets/dzikir.json');
  List dzikir = json.decode(jsonString);

  var dzikirList = <Dzikir>[];

  for (var element in dzikir) {
    Dzikir dzikir = Dzikir.fromJson(element);
    dzikirList.add(dzikir);
  }

  return dzikirList.where((e) {
    var time = morning ? "pagi" : "petang";
    return e.time == time || e.time == "";
  }).toList();
}
