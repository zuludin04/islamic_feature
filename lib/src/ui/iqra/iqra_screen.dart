import 'package:flutter/material.dart';
import 'package:islamic_feature/src/utils/toolbar.dart';

import '../../data/model/iqra.dart';
import '../../utils/constants.dart';
import 'iqra_pages.dart';

class IqraScreen extends StatelessWidget {
  const IqraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar.defaultToolbar(context, 'Iqra'),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: GridView.count(
          crossAxisCount: 2,
          children: iqraList.map((e) => _iqraItem(context, e)).toList(),
        ),
      ),
    );
  }

  Widget _iqraItem(BuildContext context, Iqra iqra) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return IqraPages(iqra: iqra);
        }),
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xffc8e6c9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                iqra.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 10,
              child: Image.asset(
                'packages/islamic_feature/assets/book.png',
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
