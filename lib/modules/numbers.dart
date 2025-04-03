import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:littleexplorer/main.dart';

class NumbersModule extends StatefulWidget {
  const NumbersModule({super.key});

  @override
  State<NumbersModule> createState() => _NumbersModuleState();
}

class _NumbersModuleState extends State<NumbersModule> {
  String selectedNumber = "zero";
  AudioPlayer audioPlayer = AudioPlayer();

  // Map of numbers and their corresponding audio files
  Map<String, String> numberSounds = {
    "zero": "modules/numbers/sounds/zero.mp3",
    "one": "modules/numbers/sounds/one.mp3",
    "two": "modules/numbers/sounds/two.mp3",
    "three": "modules/numbers/sounds/three.mp3",
    "four": "modules/numbers/sounds/four.mp3",
    "five": "modules/numbers/sounds/five.mp3",
    "six": "modules/numbers/sounds/six.mp3",
    "seven": "modules/numbers/sounds/seven.mp3",
    "eight": "modules/numbers/sounds/eight.mp3",
    "nine": "modules/numbers/sounds/nine.mp3",
  };

  // Play the sound for the selected number
  void _playSound(String numberWord) {
    String? soundFile = numberSounds[numberWord];
    print('Playing sound: $soundFile'); // Debugging the file path
    if (soundFile != null) {
      audioPlayer.play(AssetSource(soundFile)).then((_) {
        print('Audio played successfully');
      }).catchError((e) {
        print('Error playing audio: $e');
      });
    } else {
      print("Sound file not found for $numberWord");
    }
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer(); // Initialize the player
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Dispose of the player when not needed
    super.dispose();
  }

  Map<String, String> numberImages = {
    "zero": "assets/modules/numbers/number/zero.png",
    "one": "assets/modules/numbers/number/one.png",
    "two": "assets/modules/numbers/number/two.png",
    "three": "assets/modules/numbers/number/three.png",
    "four": "assets/modules/numbers/number/four.png",
    "five": "assets/modules/numbers/number/five.png",
    "six": "assets/modules/numbers/number/six.png",
    "seven": "assets/modules/numbers/number/seven.png",
    "eight": "assets/modules/numbers/number/eight.png",
    "nine": "assets/modules/numbers/number/nine.png",
  };
  Map<String, String> handnumberImages = {
    "zero": "assets/modules/numbers/hands/hzero.png",
    "one": "assets/modules/numbers/hands/hone.png",
    "two": "assets/modules/numbers/hands/htwo.png",
    "three": "assets/modules/numbers/hands/hthree.png",
    "four": "assets/modules/numbers/hands/hfour.png",
    "five": "assets/modules/numbers/hands/hfive.png",
    "six": "assets/modules/numbers/hands/hsix.png",
    "seven": "assets/modules/numbers/hands/hseven.png",
    "eight": "assets/modules/numbers/hands/height.png",
    "nine": "assets/modules/numbers/hands/hnine.png",
  };
  Widget _number(BuildContext context, String number, String numberWord) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        // Add your tap action here
        print('Tapped on number $number');
        print('selected  number  is $numberWord');

        setState(() {
          selectedNumber = numberWord; // Update the selected number
        });
        _playSound(numberWord);
      },
      child: Container(
        width: screenwidth * 0.1, // Adjusted width to make buttons closer
        height: screenheight * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selectedNumber == numberWord
              ? Color.fromRGBO(
                  156, 226, 141, 1) // Highlight color when selected
              : Colors.white, // Default color
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(217, 214, 214, 1),
              spreadRadius: 0.5,
              offset: Offset(5, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontSize: screenheight * 0.1,
              fontFamily: "GolosText",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    bool isSelected = false;

    return Scaffold(
        backgroundColor: Color.fromRGBO(53, 183, 97, 1),
        body: Stack(children: [
          Positioned.fill(
            child: Stack(
              children: [
                _circles(context, 0.13, -0.05, 0.3),
                _circles(context, 0.001, 0.28, 0.2),
                _circles(context, 0.15, 0.6, 0.1),
                _circles(context, 0.1, 0.82, 0.3),
                _circles(context, 0.78, -0.075, 0.23),
                _circles(context, 0.65, 0.2, 0.19),
                _circles(context, 0.8, 0.49, 0.1),
              ],
            ),
          ),
          Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          screenwidth * .01,
                          screenheight * .02,
                          screenwidth * .01,
                          screenheight * .02),
                      width: screenwidth,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeModule()), // Navigate to HomeModule
                          );
                        },
                        child: Image.asset(
                          "assets/modules/letters/homebtn.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: screenwidth,
                      child: Center(
                        child: Text(
                          "NUMBERS",
                          style: TextStyle(
                            fontFamily: "IrishGrover",
                            fontSize: screenheight * 0.12,
                            color: Color.fromRGBO(177, 255, 118, 1),
                            shadows: [
                              Shadow(
                                offset: Offset(2.5, 2.5),
                                blurRadius: 6.0,
                                color: Color.fromRGBO(24, 47, 6, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          screenwidth * .01,
                          screenheight * .02,
                          screenwidth * .01,
                          screenheight * .02),
                      width: screenwidth,
                      child: InkWell(
                        onTap: () => showSettingsPopup(context),
                        child: Image.asset(
                          "assets/modules/letters/settingbtn.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                    width: screenwidth,
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: screenwidth,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Expanded(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: screenwidth * .01),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      screenwidth * .035,
                                                      0,
                                                      0,
                                                      0),
                                                  child: Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        print(
                                                            "Sound Button Pressed!");
                                                        _playSound(
                                                            selectedNumber);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Image.asset(
                                                          "assets/modules/letters/soundbtn.png",
                                                          fit: BoxFit.cover,
                                                          height: screenheight *
                                                              0.2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    // First Image (hone.png)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        screenwidth * 0,
                                                        screenheight * 0,
                                                        screenwidth * 0,
                                                        screenheight * 0,
                                                      ),
                                                      child: Image.asset(
                                                        handnumberImages[
                                                                selectedNumber] ??
                                                            "assets/modules/numbers/hands/hzero.png",
                                                        height:
                                                            screenheight * 0.3,
                                                        width: screenwidth * .3,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: screenheight *
                                                              0), // Reduce space between text and image
                                                      child: Text(
                                                        selectedNumber.isEmpty
                                                            ? 'No Number Selected'
                                                            : selectedNumber
                                                                .toUpperCase(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              screenheight *
                                                                  0.08,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    // Second Image (one.png)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        screenwidth * 0,
                                                        screenheight * 0.0,
                                                        screenwidth * 0,
                                                        screenheight * 0,
                                                      ),
                                                      child: Image.asset(
                                                        numberImages[
                                                                selectedNumber] ??
                                                            "assets/modules/numbers/number/zero.png",
                                                        height:
                                                            screenheight * 0.3,
                                                        width: screenwidth * .3,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      //NUMBER BUTTONS
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Center(
                                            child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    screenwidth * 0,
                                                    screenheight * 0,
                                                    screenwidth * 0,
                                                    screenheight * 0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    screenheight *
                                                                        0.01),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            _number(context,
                                                                "1", "one"),
                                                            SizedBox(
                                                                width:
                                                                    screenwidth *
                                                                        .012),
                                                            _number(context,
                                                                "2", "two"),
                                                            SizedBox(
                                                                width:
                                                                    screenwidth *
                                                                        .012),
                                                            _number(context,
                                                                "3", "three"),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    screenheight *
                                                                        0.01),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            _number(context,
                                                                "4", "four"),
                                                            SizedBox(
                                                                width:
                                                                    screenwidth *
                                                                        .012),
                                                            _number(context,
                                                                "5", "five"),
                                                            SizedBox(
                                                                width:
                                                                    screenwidth *
                                                                        .012),
                                                            _number(context,
                                                                "6", "six"),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    screenheight *
                                                                        0.01),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            _number(context,
                                                                "7", "seven"),
                                                            SizedBox(
                                                                width:
                                                                    screenwidth *
                                                                        .012),
                                                            _number(context,
                                                                "8", "eight"),
                                                            SizedBox(
                                                                width:
                                                                    screenwidth *
                                                                        .012),
                                                            _number(context,
                                                                "9", "nine"),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    screenheight *
                                                                        0.01),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            _number(context,
                                                                "0", "zero"),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenheight * 0.03,
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      )
                    ]))),
          ]))
        ]));
  }
}

Widget _circles(BuildContext context, double ctop, double cleft, double csize) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Positioned(
    top: screenHeight * ctop,
    left: screenWidth * cleft,
    child: Container(
      width: screenWidth * csize,
      height: screenHeight * csize,
      decoration: BoxDecoration(
        color: Color.fromRGBO(42, 83, 10, 1),
        shape: BoxShape.circle,
      ),
    ),
  );
}
