import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:littleexplorer/main.dart';

class ShapesModule extends StatefulWidget {
  const ShapesModule({super.key});

  @override
  State<ShapesModule> createState() => _ShapesModuleState();
}

class _ShapesModuleState extends State<ShapesModule> {
  int shapenumber = 1;
  final AudioPlayer _audioPlayer = AudioPlayer();
  String selectedShape = "SQUARE"; // Default shape

  final List<String> shapes = [
    "SQUARE",
    "CIRCLE",
    "TRIANGLE",
    "STAR",
    "DIAMOND",
    "HEART",
    "RECTANGLE",
    "OVAL",
    "PENTAGON",
    "HEXAGON",
    "OCTAGON",
    "PARALLELOGRAM",
    "TRAPEZOID",
    "NONAGON",
    "DECAGON",
    "DODECAGON",
    "SPIRAL",
    "ARROW"
  ];

  final Map<String, String> shapeSounds = {
    // Same as before
    for (var shape in [
      "SQUARE",
      "CIRCLE",
      "TRIANGLE",
      "STAR",
      "DIAMOND",
      "HEART",
      "RECTANGLE",
      "OVAL",
      "PENTAGON",
      "HEXAGON",
      "OCTAGON",
      "PARALLELOGRAM",
      "TRAPEZOID",
      "NONAGON",
      "DECAGON",
      "DODECAGON",
      "SPIRAL",
      "ARROW"
    ])
      shape: "${shape.toLowerCase()}.mp3"
  };

  final Map<String, String> shapeimage = {
    "SQUARE": "assets/modules/shapes/square.png",
    "CIRCLE": "assets/modules/shapes/circle.png",
    "TRIANGLE": "assets/modules/shapes/triangle.png",
    "STAR": "assets/modules/shapes/star.png",
    "DIAMOND": "assets/modules/shapes/diamond.png",
    "HEART": "assets/modules/shapes/heart.png",
    "RECTANGLE": "assets/modules/shapes/rectangle.png",
    "OVAL": "assets/modules/shapes/oval.png",
    "PENTAGON": "assets/modules/shapes/pentagon.png",
    "HEXAGON": "assets/modules/shapes/hexagon.png",
    "OCTAGON": "assets/modules/shapes/octagon.png",
    "PARALLELOGRAM": "assets/modules/shapes/parallelogram.png",
    "TRAPEZOID": "assets/modules/shapes/trapezoid.png",
    "NONAGON": "assets/modules/shapes/nonagon.png",
    "DECAGON": "assets/modules/shapes/decagon.png",
    "DODECAGON": "assets/modules/shapes/dodecagon.png",
    "SPIRAL": "assets/modules/shapes/spiral.png",
    "ARROW": "assets/modules/shapes/arrow.png"
  };

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playSound(String shape) async {
    String? soundFile = shapeSounds[shape];
    if (soundFile != null) {
      try {
        await _audioPlayer.stop();
        await _audioPlayer
            .play(AssetSource("modules/shapes/sounds/$soundFile"));
      } catch (e) {
        debugPrint("Error playing sound: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(217, 77, 87, 1),
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
                          "SHAPES",
                          style: TextStyle(
                            fontFamily: "IrishGrover",
                            fontSize: screenheight * 0.12,
                            color: Color.fromRGBO(83, 10, 10, 1),
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
                                        child: Column(children: [
                                          //showingg shapes
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              width: screenwidth * .4,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color.fromRGBO(163, 29,
                                                          29, 1), // Top color
                                                      Color.fromRGBO(83, 10, 10,
                                                          1), // Bottom color
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      width:
                                                          screenwidth * 0.005,
                                                      color: Color.fromRGBO(
                                                          83, 10, 10, 1)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.25),
                                                      spreadRadius: .5,
                                                      offset: Offset(5, 3),
                                                    ),
                                                  ]),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: Image.asset(
                                                        shapeimage[
                                                                selectedShape] ??
                                                            "assets/modules/shapes/square.png",
                                                        height:
                                                            screenheight * 0.3,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      selectedShape,
                                                      style: TextStyle(
                                                        fontSize:
                                                            screenheight * 0.07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  screenwidth * 0,
                                                  screenheight * .03,
                                                  screenwidth * 0,
                                                  screenheight * 0.02),
                                              child: InkWell(
                                                onTap: () {
                                                  print(
                                                      "Sound Button Pressed!");
                                                  _playSound(selectedShape);
                                                },
                                                child: Image.asset(
                                                  "assets/modules/letters/soundbtn.png",
                                                  fit: BoxFit.contain,
                                                  height: screenheight * 0.08,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  screenwidth * .01,
                                                  screenheight * .02,
                                                  screenwidth * .01,
                                                  screenheight * .05),
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    screenwidth * .01,
                                                    screenheight * 0,
                                                    screenwidth * .008,
                                                    screenheight * 0),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      163, 29, 29, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      GridView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount:
                                                              3, // 3 shapes per row
                                                          crossAxisSpacing:
                                                              10, // Space between items horizontally
                                                          mainAxisSpacing:
                                                              10, // Space between items vertically
                                                          childAspectRatio:
                                                              1, // Adjust for shape size
                                                        ),
                                                        itemCount:
                                                            shapes.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          String shape =
                                                              shapes[index];
                                                          return _difshapes(
                                                              context,
                                                              shapeimage[
                                                                  shape]!,
                                                              shape);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            screenheight * 0.03,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
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

  Widget _difshapes(BuildContext context, String shapeImage, String shapeName) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    bool isSelected = shapeName == selectedShape;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedShape = shapeName;
          _playSound(selectedShape); // Play sound when tapped
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromRGBO(215, 131, 131, 1)
              : Colors.white, // Change color if selected
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(217, 214, 214, 1),
              spreadRadius: .5,
              offset: Offset(5, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(shapeImage, height: screenheight * 0.15),
            Text(
              shapeName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenheight * 0.045,
                fontFamily: "BebasNeue",
                color: isSelected
                    ? Colors.white
                    : Colors.black, // Change text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circles(
      BuildContext context, double ctop, double cleft, double csize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: screenHeight * ctop,
      left: screenWidth * cleft,
      child: Container(
        width: screenWidth * csize,
        height: screenHeight * csize,
        decoration: BoxDecoration(
          color: Color.fromRGBO(163, 29, 29, 1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
