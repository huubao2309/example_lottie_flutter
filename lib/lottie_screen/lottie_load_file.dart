import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

import '../page_dragger.dart';

class LottieLoadFileScreen extends StatefulWidget {
  @override
  _LottieLoadFileScreenState createState() => _LottieLoadFileScreenState();
}

class _LottieLoadFileScreenState extends State<LottieLoadFileScreen> {
  LottieController controllerLottie;
  StreamController<double> newProgressStream;

  _LottieLoadFileScreenState() {
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("From File"),
              ),
              Container(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: LottieView.fromFile(
                    filePath: "lottie_json/newAnimation.json",
                    autoPlay: true,
                    loop: true,
                    reverse: true,
                    onViewCreated: onViewCreatedFile,
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Change Color"),
                onPressed: () {
                  // Set Color of KeyPath
                  this.controllerLottie.setValue(
                      value: LOTColorValue.fromColor(
                          color: Color.fromRGBO(0, 0, 255, 1)),
                      keyPath: "body Konturen.Gruppe 1.Fläche 1");
                  // Set Opacity of KeyPath
                  this.controllerLottie.setValue(
                      value: LOTOpacityValue(opacity: 0.1),
                      keyPath: "body Konturen.Gruppe 1.Fläche 1");
                },
                color: Colors.blue,
                elevation: 4.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Drag anywhere to change animation progress"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onViewCreatedFile(LottieController controller) {
    this.controllerLottie = controller;
    newProgressStream.stream.listen(
      (double progress) {
        this.controllerLottie.setAnimationProgress(progress);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    newProgressStream.close();
  }
}
