import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:slider_button/slider_button.dart';

import '../components/drug_component.dart';
import '../models/drug.dart';
import '../services/drug_service.dart';

class CPRPage extends StatefulWidget {
  const CPRPage({super.key});

  @override
  State<CPRPage> createState() => _CPRPageState();
}

class _CPRPageState extends State<CPRPage> {
  bool reaActive = false;
  Stopwatch stopwatch = Stopwatch();
  Duration duration = const Duration();
  Duration analysis = const Duration();
  Duration adrenaline = const Duration();
  bool isAnalysis = false;
  Timer? timer;
  Timer? player;

  @override
  void initState() {
    analysis = const Duration(seconds: 120);
    adrenaline = const Duration(seconds: 180);
    super.initState();
  }

  startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    }
  }

  stopTimer() {
    setState(() {
      timer!.cancel();
      //player!.cancel();
      duration = const Duration();
      analysis = const Duration(seconds: 120);
      adrenaline = const Duration(seconds: 180);
    });
  }

  addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);

      if(analysis.inSeconds > 0){
        analysis = Duration(seconds: analysis.inSeconds - 1);
      }

      if(adrenaline.inSeconds > 0){
        adrenaline = Duration(seconds: adrenaline.inSeconds - 1);
      }
    });
  }

  playSound() {
    AudioPlayer().play(AssetSource('sounds/metronome.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: timer != null && timer!.isActive
            ? Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                        'Beginn CPR',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(
                        '${duration.inMinutes}:${duration.inSeconds % 60}',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Nächste Analyse',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(
                        '${analysis.inMinutes}:${analysis.inSeconds % 60}',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Nächstes Adrenalin',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(
                        '${adrenaline.inMinutes}:${adrenaline.inSeconds % 60}',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 20,
                    ),
                    DrugComponent(drug: Drug(name: 'Adrenalin', color: Colors.red)),
                    const SizedBox(
                      height: 20,
                    ),
                    DrugComponent(drug: Drug(name: 'Amiodaron', color: Colors.blue)),
                    const SizedBox(
                      height: 20,
                    ),
                    SliderButton(
                      action: () {
                        ///Do something here
                        stopTimer();
                      },
                      shimmer: false,
                      label: const Text(
                        "STOP CPR",
                        style: TextStyle(
                            color: Color(0xff4a4a4a),
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      icon: const Text(
                        "X",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 44,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : InkWell(
                onTap: () => startTimer(),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                      color: Color(0xFFf44336),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: const Center(
                    child: Text(
                      'START CPR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
    );
  }
}