import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../../utils/toolbar.dart';
import 'ripple_animation.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({Key? key}) : super(key: key);

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int tasbihCount = 0;
  int totalCount = 0;

  late AudioCache _audioCache;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.STOP);
    _audioCache = AudioCache(
      fixedPlayer: _audioPlayer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar.defaultToolbar(
        context,
        'Tasbih',
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                tasbihCount = 0;
                totalCount = 0;
              });
            },
            icon: const Icon(Icons.repeat),
            color: Colors.black,
          ),
        ],
      ),
      body: InkWell(
        onTap: () {
          setState(() {
            if (_audioPlayer.state == PlayerState.PLAYING) {
              _audioPlayer.stop();
              if (tasbihCount % 33 == 0) {
                _audioCache.play('coin_sound.mp3');
              } else {
                _audioCache.play('tap_tasbih.wav');
              }
            } else {
              if (tasbihCount % 33 == 0) {
                _audioCache.play('coin_sound.mp3');
              } else {
                _audioCache.play('tap_tasbih.wav');
              }
            }
          });
          counting();
        },
        splashFactory: NoSplash.splashFactory,
        enableFeedback: false,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        highlightColor: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'Total :',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '$totalCount',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              RippleAnimation(count: '$tasbihCount'),
            ],
          ),
        ),
      ),
    );
  }

  void counting() {
    setState(() {
      tasbihCount += 1;
      totalCount += 1;
      if (tasbihCount % 33 == 0) {
        Vibrate.vibrate();
        Vibrate.feedback(FeedbackType.light);
      }
      if (tasbihCount > 33) {
        tasbihCount = 1;
      }
    });
  }
}
