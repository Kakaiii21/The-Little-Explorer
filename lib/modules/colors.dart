import 'package:flutter/material.dart';
import 'package:littleexplorer/main.dart';

class ColorsModule extends StatefulWidget {
  const ColorsModule({super.key});

  @override
  State<ColorsModule> createState() => _ColorsModuleState();
}

class _ColorsModuleState extends State<ColorsModule> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 243, 150, 1),
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
                          "COLORS",
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
                                      // First Column with images and sound button
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // First Image (hone.png)
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                screenwidth * 0,
                                                screenheight * 0.03,
                                                screenwidth * 0,
                                                screenheight * 0.02,
                                              ),
                                              child: Image.asset(
                                                "assets/modules/numbers/hands/hone.png",
                                                fit: BoxFit.contain,
                                                height: screenheight *
                                                    0.2, // Ensure image size fits nicely
                                              ),
                                            ),
                                            // Sound Button next to the image
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      screenheight * 0.02),
                                              child: InkWell(
                                                onTap: () {
                                                  print(
                                                      "Sound Button Pressed!");
                                                  // _playSound(selectedShape); // Add your sound logic
                                                },
                                                child: Image.asset(
                                                  "assets/modules/letters/soundbtn.png",
                                                  fit: BoxFit.contain,
                                                  height: screenheight *
                                                      0.08, // Adjust button size
                                                ),
                                              ),
                                            ),
                                            // Text label for "ONE"
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: screenheight * 0.02),
                                              child: Text(
                                                "ONE",
                                                style: TextStyle(
                                                  fontSize: screenheight * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            // Second Image (one.png)
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                screenwidth * 0,
                                                screenheight * 0.03,
                                                screenwidth * 0,
                                                screenheight * 0.02,
                                              ),
                                              child: Image.asset(
                                                "assets/modules/numbers/number/one.png",
                                                fit: BoxFit.contain,
                                                height: screenheight *
                                                    0.2, // Adjust image size
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]))
                  ]),
                ))
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
        color: Color.fromRGBO(173, 125, 48, 1),
        shape: BoxShape.circle,
      ),
    ),
  );
}
