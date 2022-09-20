import 'package:flutter/material.dart';
import 'package:islamic_feature/src/ui/dzikir/dzikir_list.dart';

import '../../utils/tab_item.dart';

class DzikirScreen extends StatelessWidget {
  const DzikirScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.chevron_left_rounded,
              color: Color(0xff111410),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Dzikir',
            style: TextStyle(
              color: Color(0xff111410),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Color(0xff4caf50),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              TabItem(title: 'Dzikir Pagi'),
              TabItem(title: 'Dzikir Petang'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DzikirList(isMorningDzikir: true),
            DzikirList(isMorningDzikir: false),
          ],
        ),
      ),
    );
  }
}
