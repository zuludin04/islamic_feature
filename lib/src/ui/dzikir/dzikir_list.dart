import 'package:flutter/material.dart';

import '../../data/islamic_feature_data.dart';
import '../../data/model/dzikir.dart';
import 'dzikir_item.dart';

class DzikirList extends StatelessWidget {
  final bool isMorningDzikir;

  const DzikirList({Key? key, required this.isMorningDzikir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Dzikir>>(
      future: loadDzikirData(isMorningDzikir),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return DzikirItem(
                  dzikir: snapshot.data?[index],
                  number: index + 1,
                  index: index,
                );
              },
              itemCount: snapshot.data?.length,
            );
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
