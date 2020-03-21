import 'dart:async';

import 'package:example_lottie_flutter/page_dragger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

class LottieLoadURLScreen extends StatefulWidget {
  @override
  _LottieLoadURLScreenState createState() => _LottieLoadURLScreenState();
}

class _LottieLoadURLScreenState extends State<LottieLoadURLScreen> {
  LottieController controller;
  StreamController<double> newProgressStream;

  _LottieLoadURLScreenState() {
    newProgressStream = new StreamController<double>();
  }

  @override
  Widget build(BuildContext context) {
    return PageDragger(
      stream: this.newProgressStream,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lottie'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 150,
                child: LottieView.fromURL(
                  url:
                      "https://assets3.lottiefiles.com/datafiles/e8edab32a32a8a9402f9cd63b457993c/Plane.json",
                  autoPlay: true,
                  loop: true,
                  reverse: true,
                  onViewCreated: onViewCreated,
                ),
              ),
              Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Play"),
                    onPressed: () {
                      controller.play();
                    },
                    color: Colors.blue,
                    elevation: 4.0,
                  ),
                  RaisedButton(
                    child: Text("Stop"),
                    onPressed: () {
                      controller.stop();
                    },
                    color: Colors.blue,
                    elevation: 4.0,
                  ),
                  RaisedButton(
                    child: Text("Pause"),
                    onPressed: () {
                      controller.pause();
                    },
                    color: Colors.blue,
                    elevation: 4.0,
                  ),
                  RaisedButton(
                    child: Text("Resume"),
                    onPressed: () {
                      controller.resume();
                    },
                    color: Colors.blue,
                    elevation: 4.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onViewCreated(LottieController controller) {
    this.controller = controller;

    // Listen for when the playback completes
    this.controller.onPlayFinished.listen((bool animationFinished) {
      print("Playback complete. Was Animation Finished? " +
          animationFinished.toString());
    });
  }

  void dispose() {
    super.dispose();
    newProgressStream.close();
  }
}
