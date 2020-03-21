# Example Use Lottie Library in Flutter

*Library Lottie:* https://pub.dev/packages/flutter_lottie
*Download Lottie Json:* https://lottiefiles.com/

![Library Lottie](https://github.com/huubao2309/example_lottie_flutter/blob/master/images/lottie_full.gif)

## Setup

### 1. Setup **Lottie** lib at `pubspec.yaml` file:

```dart
dependencies:
  flutter_lottie: ^0.2.0
```

### 2. Load Lottie Json File with URL:

![Load Lottie_URL](https://github.com/huubao2309/example_lottie_flutter/blob/master/images/lottie_part_1.gif)

```dart
  child: LottieView.fromURL(
    url:
        "https://assets3.lottiefiles.com/datafiles/e8edab32a32a8a9402f9cd63b457993c/Plane.json",
    autoPlay: true,
    loop: true,
    reverse: true,
    onViewCreated: onViewCreated,
  ),
```

+ **Create Controler for handle Play, Stop, Pause, Resume:**

```dart
  // Create Controller
  LottieController controller;
  ...
  
  // Init Play Lottie Controler
  void onViewCreated(LottieController controller) {
    this.controller = controller;

    // Listen for when the playback completes
    this.controller.onPlayFinished.listen((bool animationFinished) {
      // TODO
    });
  }
  
  // Use Play, Stop, Pause, Resume
  controller.play(); // Play
  controller.stop(); // Stop
  controller.pause(); // Pause
  controller.resume(); // Resume
  
```

### 3. Load Lottie Json File with File Json:

![Load Lottie_File](https://github.com/huubao2309/example_lottie_flutter/blob/master/images/lottie_part_2.gif)

```dart
   child: LottieView.fromFile(
     filePath: "lottie_json/newAnimation.json",
     autoPlay: true,
     loop: true,
     reverse: true,
     onViewCreated: onViewCreatedFile,
   ),
```

+ **Change Color of Images:**

```dart
  // Create Controller
  LottieController controller;
  ...
  
  // Init Play Lottie Controler
  void onViewCreatedFile(LottieController controller) {
    this.controllerLottie = controller;
    newProgressStream.stream.listen(
      (double progress) {
        this.controllerLottie.setAnimationProgress(progress);
      },
    );
  }
  
  // Set Color of KeyPath
  this.controllerLottie.setValue(
       value: LOTColorValue.fromColor(
             color: Color.fromRGBO(0, 0, 255, 1)),
       keyPath: "body Konturen.Gruppe 1.Fläche 1");
  
```
