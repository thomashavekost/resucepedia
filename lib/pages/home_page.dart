import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:reawatch/components/drug_component.dart';
import 'package:reawatch/services/drug_service.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:slider_button/slider_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool reaActive = false;
  Stopwatch stopwatch = Stopwatch();
  Duration duration = Duration();
  Duration analysis = Duration();
  bool isAnalysis = false;
  Timer? timer;
  Timer? player;

  @override
  void initState() {
    analysis = Duration(seconds: 120);
    super.initState();
  }

  startTimer() {
    if(timer == null || !timer!.isActive) {
      timer = Timer.periodic(const Duration(
          seconds: 1
      ), (_) => addTime());
      player = Timer.periodic(const Duration(
          milliseconds: 600
      ), (_) => playSound());
    }
  }

  stopTimer() {
    setState(() {
      timer!.cancel();
      player!.cancel();
      duration = Duration();
      analysis = Duration(seconds: 120);
    });
  }

  addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
      analysis = Duration(seconds: analysis.inSeconds - addSeconds);
    });
  }

  playSound(){
    AudioPlayer().play(AssetSource('sounds/metronome.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MedicPedia'),
      ),
      backgroundColor: Color(0xFF8b7e74),
      body: Center(
        child: timer != null && timer!.isActive
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Gesammt: ${duration.inMinutes}:${duration.inSeconds % 60}', style: Theme.of(context).textTheme.bodyMedium),
                        Text('Analyse: ${analysis.inMinutes}:${analysis.inSeconds % 60}', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 100,),
                    Expanded(
                        child: ResponsiveGridList(
                          horizontalGridMargin: 5,
                          verticalGridSpacing: 10,
                          verticalGridMargin: 5,
                          minItemWidth: 120,
                          children: List.generate(
                              DrugService().reaDrugs.length,
                                  (index) => DrugComponent(drug: DrugService().reaDrugs[index],)
                          ),
                        ),
                    ),
                    SliderButton(
                      action: () {
                        ///Do something here
                        stopTimer();
                      },
                      shimmer: false,
                      label: Text(
                        "STOP CPR",
                        style: TextStyle(
                            color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      icon: Text(
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
                  child: Text('START CPR', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              ),
            )
      ),
    );
  }
}
