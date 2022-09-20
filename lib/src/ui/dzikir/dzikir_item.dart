import 'package:flutter/material.dart';

import '../../data/model/dzikir.dart';

class DzikirItem extends StatelessWidget {
  final Dzikir? dzikir;
  final int number;
  final int index;

  const DzikirItem({
    Key? key,
    required this.dzikir,
    required this.number,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (index + 1) % 2 == 0 ? Colors.white : const Color(0xFFF3F3F3),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$number. ',
                style: const TextStyle(fontSize: 13),
              ),
              Expanded(
                  child: Text(
                '${dzikir?.title} (${dzikir?.note})',
                style: const TextStyle(fontSize: 13),
              )),
            ],
          ),
          const SizedBox(height: 36),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              dzikir?.arabic ?? "",
              style: const TextStyle(fontFamily: 'Lateef', fontSize: 32),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: 36),
          Text(
            dzikir?.arabicLatin ?? "",
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Text(
            dzikir?.translatedId ?? "",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
