import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:littleexplorer/modules/colors.dart';
import 'package:littleexplorer/modules/letters.dart';
import 'package:littleexplorer/modules/numbers.dart';
import 'package:littleexplorer/modules/shapes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(), // Use a new screen instead
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeModule()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/HomeModule/bgday.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  "assets/HomeModule/logo.png",
                  height: screenHeight * .5,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: screenHeight * 0.05), // Adjust for spacing
                  child: Text(
                    "Tap anywhere",
                    style: TextStyle(
                      fontSize: screenHeight * .03,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeModule extends StatefulWidget {
  const HomeModule({super.key, this.level = 1}); // Default level = 1

  final int level;

  @override
  _HomeModuleState createState() => _HomeModuleState();
}

class _HomeModuleState extends State<HomeModule> {
  late int level;
  late bool isMathEnabled;
  late bool isSpellingEnabled;

  @override
  void initState() {
    super.initState();
    level = widget.level; // Initialize the level from the widget parameter
    isMathEnabled = level >= 11;
    isSpellingEnabled = level >= 11;
  }

  void handleSpellingTap(BuildContext context) {
    if (level >= 11 && level <= 20) {
      print("Navigating to Spelling Page...");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SpellingPage()),
      );
    } else {
      // Show a popup notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Only available for Level 11 to 20"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void handleMathTap(BuildContext context) {
    if (level >= 11 && level <= 20) {
      print("Navigating to Math Page...");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MathPage()),
      );
    } else {
      // Show a popup notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Only available for Level 11 to 20"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/mainModule/bgMain.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [
        // Main Row (Contains Expanded Flex 8 & Flex 1)
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Header
                      Container(
                        height: screenHeight * .2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Image.asset(
                                "assets/mainModule/logo.png",
                                height: screenHeight * .2,
                              ),
                            ),
                            const SizedBox(width: 150),
                            Image.asset(
                              "assets/mainModule/name.png",
                              height: screenHeight * .09,
                            ),
                            const SizedBox(width: 50),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/mainModule/levelbg.png",
                                  width: screenWidth * .17,
                                  height: screenWidth * .2,
                                ),
                                Text(
                                  "Level $level",
                                  // Replace with dynamic level if needed
                                  style: TextStyle(
                                    fontFamily: "IrishGrover",
                                    fontSize: screenHeight * .065,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Buttons Section
                      Container(
                        alignment: Alignment.center,
                        height: screenHeight * .59,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildButton("assets/mainModule/letterbtn.png",
                                    LettersModule()),
                                _buildButton("assets/mainModule/colorbtn.png",
                                    ColorsModule()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildButton("assets/mainModule/shapebtn.png",
                                    ShapesModule()),
                                _buildButton("assets/mainModule/numberbtn.png",
                                    NumbersModule()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Right Sidebar
              Expanded(
                flex: 1,
                child: Container(
                  height: screenHeight * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * .02),
                      _settings(context, "assets/mainModule/settingbtn.png"),
                      SizedBox(height: screenHeight * .02),
                      _sticker(context, "assets/mainModule/stickerbtn.png"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Level 1 - 10",
                  style: TextStyle(
                      fontSize: screenHeight * .03,
                      fontFamily: "BebasNeue",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  "Level 11 - 20",
                  style: TextStyle(
                      fontSize: screenHeight * .03,
                      fontFamily: "BebasNeue",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              width: double.infinity,
              height: screenHeight * .15,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _gamebuttons(context, "assets/mainModule/tracingbtn.png",
                      TracingPage()),
                  _gamebuttons(context, "assets/mainModule/matchbtn.png",
                      MatchingPage()),
                  _gamebuttonslevel(
                      context, "assets/mainModule/math2.png", MathPage(),
                      onTap: () => handleMathTap(context)),
                  _gamebuttonslevel(context, "assets/mainModule/spelling2.png",
                      SpellingPage(),
                      onTap: () => handleSpellingTap(context)),
                ],
              ),
            ),
          ],
        )
      ]),
    ));
  }

// Helper Function for Buttons

  Widget _buildButton(String assetPath, Widget targetPage) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetPage),
          );
        },
        child: Container(
          child: Ink(
            width: screenWidth * 0.35,
            height: screenHeight * 0.27,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // Clip image to match border
              child: Image.asset(assetPath, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _sticker(BuildContext context, String assetPath) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: () {},
    child: Container(
      width: screenWidth * 0.1, // Adjust width dynamically
      height: screenHeight * 0.2,
      child: Image.asset(assetPath, fit: BoxFit.contain),
    ),
  );
}

Widget _settings(BuildContext context, String assetPath) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: () => showSettingsPopup(context),
    child: Container(
      width: screenWidth * 0.08, // Adjust width dynamically
      height: screenHeight * 0.15,
      child: Image.asset(assetPath, fit: BoxFit.contain),
    ),
  );
}

void showSettingsPopup(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero, // Removes default padding
        backgroundColor: Colors.transparent, // Makes the background transparent
        child: Container(
          width: screenWidth * .5, // Full width
          height: screenHeight * .8, // Full height
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/mainModule/settingPop.png"),
              fit: BoxFit.contain,
            ),
          ),
          child: Text(""),
        ),
      );
    },
  );
}

Widget _gamebuttons(BuildContext context, String assetPath, Widget targetPage) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetPage),
      );
    },
    child: Container(
      width: screenWidth * 0.24, // Adjust width dynamically
      height: screenHeight * 15,
      child: Image.asset(assetPath, fit: BoxFit.contain),
    ),
  );
}

Widget _gamebuttonslevel(
    BuildContext context, String assetPath, Widget targetPage,
    {VoidCallback? onTap}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: onTap ??
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetPage),
          );
        },
    child: Container(
      width: screenWidth * 0.24, // Adjust width dynamically
      height: screenHeight * 15,
      child: Image.asset(assetPath, fit: BoxFit.contain),
    ),
  );
}

// Dummy Spelling Page
class TracingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Math Page")),
      body: Center(child: Text("Welcome to the Math Page!")),
    );
  }
}

class MatchingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Math Page")),
      body: Center(child: Text("Welcome to the Math Page!")),
    );
  }
}

class SpellingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spelling Page")),
      body: Center(child: Text("Welcome to the Spelling Page!")),
    );
  }
}

class MathPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Math Page")),
      body: Center(child: Text("Welcome to the Math Page!")),
    );
  }
}
