import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:littleexplorer/main.dart';

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
  Map<String, List<String>> letterWords = {
    "Aa": [
      "🍎 APPLE",
      "🐜 ANT",
      "🪓 AXE",
      "➡️ ARROW",
      "🥑 AVOCADO",
      "🐊 ALLIGATOR",
      "⚓ ANCHOR",
      "🧑‍🎨 ARTIST",
      "💪 ARM",
      "🌰 ACORN",
      "⏰ ALARM",
      "👼 ANGEL",
      "😠 ANGER",
      "🦶 ANKLE",
      "🛡️ ARMOR",
      "📔 ALBUM",
      "🎭 ACTOR",
      "🤸 ACROBAT",
      "💨 AIR",
      "🏹 ARCHER",
      "🧑‍💼 ASSISTANT"
    ],
    "Bb": [
      "🏀 BALL",
      "🎈 BALLOON",
      "🍌 BANANA",
      "🦇 BAT",
      "🐝 BEE",
      "🐻 BEAR",
      "🛏️ BED",
      "🔔 BELL",
      "🚲 BICYCLE",
      "🦜 BIRD",
      "⛵ BOAT",
      "📖 BOOK",
      "👢 BOOT",
      "🍼 BOTTLE",
      "📦 BOX",
      "👦 BOY",
      "🍞 BREAD",
      "🌉 BRIDGE",
      "🖌️ BRUSH",
      "🦋 BUTTERFLY",
      "🔘 BUTTON"
    ],
    "Cc": [
      "🎂 CAKE",
      "🐱 CAT",
      "🚗 CAR",
      "🕯️ CANDLE",
      "🧢 CAP",
      "🥕 CARROT",
      "🐄 COW",
      "🪑 CHAIR",
      "⏰ CLOCK",
      "☁️ CLOUD",
      "🌽 CORN",
      "☕ CUP",
      "🖍️ CRAYON",
      "🍬 CANDY",
      "🏰 CASTLE",
      "🥥 COCONUT",
      "🐥 CHICK",
      "📷 CAMERA",
      "🎪 CIRCUS",
      "🍒 CHERRY",
      "⭕ CIRCLE",
    ],
    "Dd": [
      "🐶 DOG",
      "🦆 DUCK",
      "🦖 DINOSAUR",
      "🦌 DEER",
      "🪆 DOLL",
      "🥁 DRUM",
      "🚪 DOOR",
      "🐬 DOLPHIN",
      "💭 DREAM",
      "💃 DANCE",
      "🌞 DAY",
      "🍩 DONUT",
      "💎 DIAMOND",
      "🌼 DANDELION",
      "🪑 DESK",
      "🌑 DARK",
      "🩺 DOCTOR",
      "🎨 DRAWING",
      "🏜️ DESERT",
      "📖 DIARY",
      "🕊️ DOVE"
    ],
    "Ee": [
      "🦅 EAGLE",
      "👂 EAR",
      "🌍 EARTH",
      "🐟 EEL",
      "🥚 EGG",
      "🍆 EGGPLANT",
      "🐘 ELEPHANT",
      "🧝 ELF",
      "💡 ELECTRIC",
      "💪 ELBOW",
      "🛗 ELEVATOR",
      "🚂 ENGINE",
      "✉️ ENVELOPE",
      "✏️ ERASER",
      "🚪 EXIT",
      "👁️ EYE",
      "🍰 ECLAIR",
      "🔊 ECHO",
      "🌬️ EXHALE",
      "🤸 EXERCISE",
      "⚡ ENERGY"
    ],
    "Ff": [
      "🌬️ FAN",
      "🪶 FEATHER",
      "🔥 FIRE",
      "🐟 FISH",
      "🚩 FLAG",
      "🦩 FLAMINGO",
      "🍟 FRIES",
      "🌸 FLOWER",
      "🏈 FOOTBALL",
      "🍴 FORK",
      "🦊 FOX",
      "🐸 FROG",
      "🍎 FRUIT",
      "🚒 FIRETRUCK",
      "🚧 FENCE",
      "☝️ FINGER",
      "🎶 FLUTE",
      "👨‍👩‍👧‍👦 FAMILY",
      "🚜 FARM",
      "🌲 FOREST",
      "👫 FRIEND"
    ],
    "Gg": [
      "🐐 GOAT",
      "🦒 GIRAFFE",
      "🍇 GRAPES",
      "🎁 GIFT",
      "🌍 GLOBE",
      "🏆 GOLD",
      "🌻 GARDEN",
      "👻 GHOST",
      "🎸 GUITAR",
      "🟢 GREEN",
      "🌱 GRASS",
      "🎮 GAME",
      "✨ GLITTER",
      "👺 GOBLIN",
      "🍬 GUMBALL",
      "🥽 GOGGLES",
      "🧤 GLOVES",
      "🌋 GEYSER",
      "😆 GIGGLE",
      "🧞 GENIE",
      "👗 GOWN"
    ],
    "Hh": [
      "🎩 Hat",
      "🐴 Horse",
      "🏠 House",
      "❤️ Heart",
      "🚁 Helicopter",
      "🍯 Honey",
      "✋ Hand",
      "🍔 Hamburger",
      "🔨 Hammer",
      "🐔 Hen",
      "🦔 Hedgehog",
      "🌭 Hotdog",
      "😀 Happy",
      "🦛 Hippo",
      "⛑️ Helmet",
      "🔥 Hot",
      "🤗 Hug",
      "🎼 Harp",
      "🏥 Hospital",
      "🎺 Horn",
      "⛰️ Hill"
    ],
    "Ii": [
      "🧊 ICE",
      "🍦 ICE CREAM",
      "🏝️ ISLAND",
      "🖋️ INK",
      "⚙️ IRON",
      "💡 IDEA",
      "📸 IMAGE",
      "📩 INVITATION",
      "⛸️ ICE SKATES",
      "🦎 IGUANA",
      "🐞 INSECTS",
      "🤔 IMAGINE",
      "♾️ INFINITY",
      "👀 INVISIBLE",
      "🌐 INTERNET",
      "🐛 INCHWORM",
      "🌿 IVY",
      "🔮 ILLUSION",
      "❄️ IGLOO",
      "🍼 INFANT",
      "🟦 INDIGO"
    ],
    "Jj": [
      "🍓 JAM",
      "🤾‍♂️ JUMP",
      "🍮 JELLY",
      "🧥 JACKET",
      "🌴 JUNGLE",
      "🧃 JUICE",
      "🧩 JIGSAW",
      "🚙 JEEP",
      "🃏 JOKER",
      "🛤️ JOURNEY",
      "📖 JOURNAL",
      "💍 JEWELRY",
      "⚖️ JUSTICE",
      "🎷 JAZZ",
      "🐆 JAGUAR",
      "😊 JOLLY",
      "🤹‍♂️ JESTER",
      "🔔 JINGLE",
      "🏢 JAIL",
      "🦖 JURASSIC",
      "🎰 JACKPOT"
    ],
    "Kk": [
      "🪁 KITE",
      "🔑 KEY",
      "👑 KING",
      "🐨 KOALA",
      "🦘 KANGAROO",
      "🍽️ KITCHEN",
      "🐱 KITTEN",
      "😊 KIND",
      "🔪 KNIFE",
      "⌨️ KEYBOARD",
      "🥝 KIWI",
      "🏰 KINGDOM",
      "🍅 KETCHUP",
      "🧒 KID",
      "🦵 KNEE",
      "🎀 KNOT",
      "✊ KNUCKLE",
      "⛽ KEROSENE",
      "🥋 KUNG FU",
      "📏 KILOMETER",
      "🫖 KETTLE"
    ],
    "Ll": [
      "💡 LAMP",
      "🦁 LION",
      "🍃 LEAF",
      "🍋 LEMON",
      "🌊 LAKE",
      "🐞 LADYBUG",
      "😆 LAUGH",
      "🍱 LUNCH",
      "🔒 LOCK",
      "🍭 LOLLIPOP",
      "⚡ LIGHTNING",
      "🧪 LABORATORY",
      "🧳 LUGGAGE",
      "😂 LAUGHTER",
      "🐑 LAMB",
      "🌋 LAVA",
      "🧱 LEGO",
      "🍀 LUCKY",
      "👄 LIPS",
      "🥬 LETTUCE",
      "🦞 LOBSTER"
    ],
    "Mm": [
      "🌙 MOON",
      "🐒 MONKEY",
      "⛰️ MOUNTAIN",
      "🥛 MILK",
      "🥭 MANGO",
      "🐭 MOUSE",
      "🏍️ MOTOR",
      "🧜‍♀️ MERMAID",
      "🎵 MUSIC",
      "🧲 MAGNET",
      "🗺️ MAP",
      "🎤 MIC",
      "👄 MOUTH",
      "📬 MAILBOX",
      "✨ MAGIC",
      "🏃 MARATHON",
      "🧁 MUFFIN",
      "🏅 MEDAL",
      "🤱 MOTHER",
      "💪 MUSCLE",
      "🌱 MINT",
    ],
    "Nn": [
      "🌿 NATURE",
      "🌙 NIGHT",
      "📓 NOTEBOOK",
      "🔢 NUMBER",
      "📿 NECKLACE",
      "🥜 NUT",
      "🍜 NOODLE",
      "🌮 NACHOS",
      "👩‍⚕️ NURSE",
      "👃 NOSE",
      "🧭 NORTH",
      "🥅 NET",
      "😴 NAP",
      "👩‍⚕️ NURSE",
      "🍗 NUGGETS",
      "🔊 NOISE",
      "⚓ NAVY",
      "🪺 NEST",
      "🪡 NEEDLE",
      "💅 NAIL",
      "👶 NEWBORN"
    ],
    "Oo": [
      "🐙 OCTOPUS",
      "🍊 ORANGE",
      "🦉 OWL",
      "🧅 ONION",
      "🌊 OCEAN",
      "💨 OXYGEN",
      "🫒 OLIVE",
      "🐋 ORCA",
      "🎭 OPERA",
      "🪐 ORBIT",
      "🥣 OATMEAL",
      "🍞 OVEN",
      "🛢️ OIL",
      "🦢 OSTRICH",
      "📄 ORIGAMI",
      "🏅 OLYMPICS",
      "🏢 OFFICE",
      "👴 OLD MAN",
      "🐂 OX",
      "🌸 ORCHID",
      "👗 OUTFIT"
    ],
    "Pp": [
      "🐼 PANDA",
      "🍕 PIZZA",
      "🎃 PUMPKIN",
      "🦜 PARROT",
      "🐧 PENGUIN",
      "🍑 PEACH",
      "🍍 PINEAPPLE",
      "🍿 POPCORN",
      "🐷 PIG",
      "✏️ PENCIL",
      "🎨 PAINT",
      "🦪 PEARL",
      "🎉 PARTY",
      "✈️ PLANE",
      "👮‍♂️ POLICE",
      "🌴 PALM TREE",
      "🙏 PRAYING",
      "🎁 PRESENT",
      "🏴‍☠️ PIRATE",
      "🧩 PUZZLE",
      "🪐 PLANET"
    ],
    "Qq": [
      "❓ QUESTION",
      "👸🏻 QUEEN",
      "🪶 QUILL",
      "🤫 QUIET",
      "🏹 QUIVER",
      "🦡 QUOLL",
      "🐨 KOALA",
      "🌓 QUARTER MOON",
      "🍋 QUINCE",
      "🦘 QUOKKA",
      "🧵 QUILT",
      "🛏️ QUILT",
      "❝ QUOTE",
      "⚛️ QUBIT",
      "🤪 QUIRKY",
      "📜 QUEST",
      "🦆 QUACK",
      "⏩ QUICKLY",
      "📝 QUIZ",
      "🥤 QUENCH",
      "🏡 QUAINT",
    ],
    "Rr": [
      "🌈 RAINBOW",
      "🐰 RABBIT",
      "🚀 ROCKET",
      "🤖 ROBOT",
      "🌧️ RAIN",
      "🌹 ROSE",
      "💍 RING",
      "🛣️ ROAD",
      "📻 RADIO",
      "📏 RULER",
      "🍚 RICE",
      "🎶 RATTLE",
      "🦌 REINDEER",
      "🚣 RAFT",
      "⏹️ RECTANGLE",
      "🚆 RAIL",
      "🪨 ROCK",
      "🏎️ RACECAR",
      "🧥 RAINCOAT",
      "🌊 RIVER",
      "🪢 ROPE"
    ],
    "Ss": [
      "☀️ SUN",
      "⭐ STAR",
      "🐍 SNAKE",
      "🥪 SANDWICH",
      "⛄ SNOWMAN",
      "⚽ SOCCER",
      "🥤 STRAW",
      "🏫 SCHOOL",
      "🦈 SHARK",
      "🧦 SOCKS",
      "🐌 SNAIL",
      "✂️ SCISSORS",
      "🧳 SUITCASE",
      "🛝 SLIDE",
      "🎅 SANTA",
      "🦭 SEAL",
      "🐚 SHELL",
      "🦸‍♂️ SUPERMAN",
      "🐿️ SQUIRREL",
      "🥄 SPOON",
      "👕 SHIRT"
    ],
    "Tt": [
      "🐅 TIGER",
      "🐢 TURTLE",
      "🌳 TREE",
      "🚂 TRAIN",
      "🚛 TRUCK",
      "🧸 TEDDY",
      "🍅 TOMATO",
      "🦷 TOOTH",
      "🌮 TACO",
      "🔺 TRIANGLE",
      "🔭 TELESCOPE",
      "🎾 TENNIS",
      "👩‍🏫 TEACHER",
      "🚕 TAXI",
      "🌪️ TORNADO",
      "🌷 TULIP",
      "🍬 TOFFEE",
      "🫔 TAMALE",
      "🛁 TOWEL",
      "🍞 TOAST",
      "🏹 ARCHER",
      "🧚‍♀️ FAIRY",
      "⛺ TENT",
      "🍞 TOASTER"
    ],
    "Uu": [
      "☂️ UMBRELLA",
      "🦄 UNICORN",
      "👔 UNIFORM",
      "🌌 UNIVERSE",
      "🪕 UKULELE",
      "⬆️ UP",
      "🍴 UTENSIL",
      "🪐 URANUS",
      "⬇️ UNDER",
      "🔌 UNPLUG",
      "🥇 ULTIMATE",
      "↩️ U-TURN",
      "📈 UPGRADE",
      "🔓 UNLOCK",
      "🏙️ URBAN",
      "😠 UPSET",
      "🤝 UNITY",
      "🧔🏻 UNCLE",
      "💾 USB",
      "🤝 UNITY",
      "🛸 UFO"
    ],
    "Vv": [
      "🦸 VIGILANTE",
      "🌪️ VORTEX",
      "🗣️ VOICE",
      "👁️ VISION",
      "🌋 VOLCANO",
      "🧛 VAMPIRE",
      "🎻 VIOLIN",
      "🏺 VASE",
      "🏆 VICTORY",
      "🥦 VEGETABLE",
      "🟣 VIOLET",
      "🚗 VEHICLES",
      "🏖️ VACATION",
      "🚐 VAN",
      "🎬 VIDEO",
      "👔 VEST",
      "🪪 VISA",
      "🍦 VANILLA",
      "🙇‍♂️ VOW",
      "💉 VACCINE",
      "🦅 VULTURE"
    ],
    "Ww": [
      "💧 WATER",
      "🪟 WINDOW",
      "⌚ WATCH",
      "🐋 WHALE",
      "🧇 WAFFLE",
      "🐺 WOLF",
      "🪱 WORM",
      "🌬️ WIND",
      "🎶 WHISTLE",
      "🤼 WRESTLING",
      "👛 WALLET",
      "🤔 WONDER",
      "💂 WARRIOR",
      "🐨 WOMBAT",
      "👮 WARDEN",
      "🔧 WRENCH",
      "🚧 WRECKAGE",
      "🦣 WOOLLY",
      "😔 WISTFUL",
      "🥄 WHISK",
      "🛠️ WORK"
    ],
    "Xx": [
      "🦴 X-RAY",
      "📟 XRAY",
      "🖨️ XEROX",
      "💡 XENON",
      "🦴 X-ray",
      "🎵 Xylophone",
      "🎄 Xmas",
      "🍉 Xigua"
    ],
    "Yy": [
      "🐂 Yak",
      "🧶 Yarn",
      "😴 Yawn",
      "🟡 Yellow",
      "🥣 Yogurt",
      "🪀 Yoyo",
      "⛵ Yacht",
      "📆 Year",
      "😋 Yummy",
      "🌳 Yard",
      "📏 Yardstick",
      "🤩 Yahoo",
      "👍 Yes",
      "🥚 Yolk",
      "👶 Young",
      "🧘 Yoga",
      "🐾 Yeti",
      "🔥 Yule Log",
    ],
    "Zz": [
      "🦓 Zebra",
      "🏞️ Zoo",
      "🔍 Zoom",
      "🎒 Zipper",
      "🥒 Zucchini",
      "⚡ Zap",
      "🦓 Zebra",
      "〰️ Zigzag",
      "🍋 Zest",
      "🐟 Zebrafish",
      "♌ Zodiac",
      "👨‍🌾 Zookeeper",
      "🧟 Zombie",
      "💃 Zumba",
      "💰 Zillion",
      "☯️ Zen",
      "😊 Zestful",
      "🎢 Zipline",
      "0️⃣ Zero",
      "🚷 Zone",
    ]

    // Add more entries for other letters
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
    String theletter = (letters.isNotEmpty &&
            letternumber > 0 &&
            letternumber <= letters.length)
        ? letters[letternumber - 1]
        : "Aa"; // Default to "Aa" if empty or out of bounds
    List<String> wordsList =
        letterWords.containsKey(theletter) ? letterWords[theletter]! : [];

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
                              "LETTERS",
                              style: TextStyle(
                                fontFamily: "IrishGrover",
                                fontSize: screenheight * 0.12,
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
                                                fontSize: screenheight * 0.35,
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
                                                letternumber++; // Increase letter number safely
                                              }
                                            });

                                            if (letternumber <=
                                                letters.length) {
                                              print(
                                                  "Next Button Pressed! New Letter: ${letters[letternumber - 1]}");
                                            } else {
                                              print("Reached the last letter!");
                                            }
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

                        // Words

                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(135, 71, 225, 1),
                                    border: Border.all(
                                      color: Color.fromRGBO(34, 12, 114, 1),
                                      width: screenwidth * .005,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        for (int i = 0;
                                            i < wordsList.length;
                                            i += 3)
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: screenheight * .03),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                for (int j = 0; j < 3; j++)
                                                  if (i + j <
                                                      wordsList.length) ...[
                                                    Expanded(
                                                      flex: 1,
                                                      child: _words(
                                                        context,
                                                        wordsList[i + j]
                                                            .split(" ")[0],
                                                        wordsList[i + j]
                                                            .split(" ")[1],
                                                      ),
                                                    ),
                                                    if (j < 2)
                                                      SizedBox(
                                                          width: screenwidth *
                                                              .015),
                                                  ],
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
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

Widget _words(BuildContext context, emo, word) {
  double screenwidth = MediaQuery.of(context).size.width;
  double screenheight = MediaQuery.of(context).size.height;
  return Expanded(
    flex: 1,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(217, 214, 214, 1),
            spreadRadius: .5,
            offset: Offset(5, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Keeps it compact
          children: [
            Text(emo, style: TextStyle(fontSize: screenheight * 0.13)),
            Text(word,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
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
