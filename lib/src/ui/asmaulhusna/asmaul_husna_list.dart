import 'package:flutter/material.dart';

import '../../data/islamic_feature_data.dart';
import '../../data/model/asmaul_husna.dart';

class AsmaulHusnaList extends StatelessWidget {
  final Color? asmaBgColor;
  final Color textColor;

  const AsmaulHusnaList({
    Key? key,
    this.asmaBgColor,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<AsmaulHusna>>(
        future: loadAsmaulHusnaData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: .8,
                  children:
                      snapshot.data!.map((e) => _asmaulHusnaItem(e)).toList(),
                ),
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Widget _asmaulHusnaItem(AsmaulHusna asmaulHusna) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: asmaBgColor ?? Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              asmaulHusna.latin ?? "",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                asmaulHusna.arab ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              asmaulHusna.arti ?? "",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
