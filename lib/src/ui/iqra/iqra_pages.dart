import 'package:flutter/material.dart';

import '../../data/model/iqra.dart';

class IqraPages extends StatefulWidget {
  final Iqra iqra;

  const IqraPages({Key? key, required this.iqra}) : super(key: key);

  @override
  State<IqraPages> createState() => _IqraPagesState();
}

class _IqraPagesState extends State<IqraPages> {
  final PageController _pageController = PageController();

  int iqraPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _iqraSlider(widget.iqra.images),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -0.1),
                  spreadRadius: 0.1,
                  color: Colors.black26,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () => _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  icon: const Icon(Icons.skip_previous_rounded),
                ),
                Text('${iqraPage + 1}'),
                IconButton(
                  onPressed: () => _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  icon: const Icon(Icons.skip_next_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iqraSlider(List<String> images) {
    return PageView.builder(
      controller: _pageController
        ..addListener(() {
          setState(() {
            iqraPage = _pageController.page!.toInt();
          });
        }),
      itemBuilder: (context, index) {
        return Image.network(
          images[index],
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        );
      },
      itemCount: images.length,
    );
  }
}
