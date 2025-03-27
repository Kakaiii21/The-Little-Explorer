import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class LettersModule extends StatefulWidget {
  const LettersModule({super.key});

  @override
  State<LettersModule> createState() => _LettersModuleState();
}

class _LettersModuleState extends State<LettersModule> {
  int letternumber = 1; // Initialized as integer
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<String> letters = [
    "Aa",
    "Bb",
    "Cc",
    "Dd",
    "Ee",
    "Ff",
    "Gg",
    "Hh",
    "Ii",
    "Jj",
    "Kk",
    "Ll",
    "Mm",
    "Nn",
    "Oo",
    "Pp",
    "Qq",
    "Rr",
    "Ss",
    "Tt",
    "Uu",
    "Vv",
    "Ww",
    "Xx",
    "Yy",
    "Zz"
  ];
  Map<String, String> letterSounds = {
    "Aa": "a.mp3",
    "Bb": "b.mp3",
    "Cc": "c.mp3",
    "Dd": "d.mp3",
    "Ee": "e.mp3",
    "Ff": "f.mp3",
    "Gg": "g.mp3",
    "Hh": "h.mp3",
    "Ii": "i.mp3",
    "Jj": "j.mp3",
    "Kk": "k.mp3",
    "Ll": "l.mp3",
    "Mm": "m.mp3",
    "Nn": "n.mp3",
    "Oo": "o.mp3",
    "Pp": "p.mp3",
    "Qq": "q.mp3",
    "Rr": "r.mp3",
    "Ss": "s.mp3",
    "Tt": "t.mp3",
    "Uu": "u.mp3",
    "Vv": "v.mp3",
    "Ww": "w.mp3",
    "Xx": "x.mp3",
    "Yy": "y.mp3",
    "Zz": "z.mp3",
  };

  void _playSound(String letter) async {
    String? soundFile = letterSounds[letter];
    if (soundFile != null) {
      String path = "assets/sounds/$soundFile"; // Corrected asset path

      try {
        await _audioPlayer.stop();
        await _audioPlayer.play(AssetSource("sounds/$soundFile"));
      } catch (e) {
        print("Error playing sound: $e");
      }
    } else {
      print("No sound file found for $letter");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    // Ensure valid letter selection
    String theletter = (letternumber > 0 && letternumber <= letters.length)
        ? letters[letternumber - 1]
        : "Aa"; // Default to "Aa" if out of bounds

    return Scaffold(
        backgroundColor: Color.fromRGBO(105, 82, 234, 1),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: screenwidth,
                          child: InkWell(
                            onTap: () {
                              print("Home Button Pressed!");
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
                              "LETTERS",
                              style: TextStyle(
                                fontFamily: "IrishGrover",
                                fontSize: screenheight * 0.15,
                                color: Color.fromRGBO(228, 159, 255, 1),
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.5, 2.5),
                                    blurRadius: 6.0,
                                    color: Color.fromRGBO(97, 74, 36, 1),
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
                          width: screenwidth,
                          child: InkWell(
                            onTap: () {
                              print("Settings Button Pressed!");
                            },
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

                // Main Content
                Expanded(
                  flex: 4,
                  child: Container(
                    width: screenwidth,
                    child: Row(
                      children: [
                        // Left Section: Buttons & Letters
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Top Section: Navigation & Letter Display
                              Expanded(
                                flex: 4,
                                child: Container(
                                  width: screenwidth,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Back Button
                                      Expanded(
                                        child: Container(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (letternumber > 1) {
                                                  letternumber--; // Decrease letter number
                                                }
                                              });
                                              print(
                                                  "Previous Button Pressed! New Letter: ${letters[letternumber - 1]}");
                                            },
                                            child: Image.asset(
                                              theletter == "Aa"
                                                  ? "assets/modules/letters/nobackbtn.png"
                                                  : "assets/modules/letters/backbtn.png",
                                              fit: BoxFit.contain,
                                              height: screenheight * 0.2,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Centered Letter
                                      Expanded(
                                          flex: 5,
                                          child: Container(
                                            child: Text(
                                              theletter,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: screenheight * 0.4,
                                                color: Colors.white,
                                                shadows: [
                                                  Shadow(
                                                    offset: Offset(4, 4),
                                                    blurRadius: 6.0,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),

                                      // Next Button
                                      Expanded(
                                          child: Container(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (letternumber <
                                                  letters.length) {
                                                letternumber++; // Increase letter number
                                              }
                                            });
                                            print(
                                                "Next Button Pressed! New Letter: ${letters[letternumber - 1]}");
                                          },
                                          child: Image.asset(
                                            theletter == "Zz"
                                                ? "assets/modules/letters/nonextbtn.png"
                                                : "assets/modules/letters/nextbtn.png",
                                            fit: BoxFit.contain,
                                            height: screenheight * 0.2,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ),

                              // Sound Button
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: InkWell(
                                    onTap: () {
                                      print("Sound Button Pressed!");
                                      _playSound(theletter);
                                    },
                                    child: Image.asset(
                                      "assets/modules/letters/soundbtn.png",
                                      fit: BoxFit.contain,
                                      height: screenheight * 0.08,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right Empty Section
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: screenwidth,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
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
        color: Color.fromRGBO(34, 12, 114, 1),
        shape: BoxShape.circle,
      ),
    ),
  );
}
