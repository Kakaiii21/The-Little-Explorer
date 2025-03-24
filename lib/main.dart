import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeModule()),
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/HomeModule/bgday.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Keeps the column centered
              children: [
                Image.asset(
                  "assets/HomeModule/logo.png",
                  scale: 12,
                ),
                const SizedBox(
                    height: 15), // Adds spacing between image and text
                const Text("Tap anywhere",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
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
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Image.asset(
                                "assets/mainModule/logo.png",
                                height: 80,
                              ),
                            ),
                            const SizedBox(width: 150),
                            Image.asset(
                              "assets/mainModule/name.png",
                              height: 40,
                            ),
                            const SizedBox(width: 50),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/mainModule/levelbg.png",
                                  width: 150,
                                  height: 150,
                                ),
                                Text(
                                  "Level $level",
                                  // Replace with dynamic level if needed
                                  style: TextStyle(
                                    fontFamily: "IrishGrover",
                                    fontSize: 30,
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
                        height: 222,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildButton("assets/mainModule/letterbtn.png"),
                                _buildButton("assets/mainModule/colorbtn.png"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildButton("assets/mainModule/shapebtn.png"),
                                _buildButton("assets/mainModule/numberbtn.png"),
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
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      _settings("assets/mainModule/settingbtn.png"),
                      const SizedBox(height: 10),
                      _settings("assets/mainModule/stickerbtn.png"),
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
                      fontSize: 15,
                      fontFamily: "BebasNeue",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  "Level 11 - 20",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "BebasNeue",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              width: double.infinity,
              height: 55,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          level--;
                        });
                      },
                      child: Ink(
                        width: 210,
                        height: 100,
                        child: Image.asset("assets/mainModule/tracingbtn.png"),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          level++;
                        });
                      },
                      child: Ink(
                        width: 210,
                        height: 110,
                        child: Image.asset("assets/mainModule/matchbtn.png"),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => handleMathTap(context),
                      child: Ink(
                        width: 210,
                        height: 110,
                        child: Image.asset("assets/mainModule/math2.png"),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => handleSpellingTap(context),
                      child: Ink(
                        width: 210,
                        height: 110,
                        child: Image.asset("assets/mainModule/spelling2.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    ));
  }

// Helper Function for Buttons
  Widget _buildButton(String assetPath) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Ink(
          width: 210,
          height: 110,
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}

Widget _settings(String assetPath) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {},
      child: Ink(
        width: 180,
        height: 80,
        child: Image.asset(assetPath),
      ),
    ),
  );
}

// Dummy Spelling Page
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
