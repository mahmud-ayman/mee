import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me/widget/box_widget.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('فشل في فتح الرابط');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 8, 37, 62),
              const Color.fromARGB(255, 75, 124, 166),
              Color.fromARGB(255, 24, 35, 82),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(flex: 1),

                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 120,
                    child: CircleAvatar(
                      radius: 115,
                      backgroundImage: AssetImage(
                        'assets/images/anime-girl.png',
                      ),
                    ),
                  ),
                  Text(
                    "Mahmoud Ayman ",
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Text(
                    'flutter developer',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black45,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                        fontSize: 20,
                        color: const Color.fromARGB(204, 239, 239, 239),
                      ),
                    ),
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 247, 247, 247),
                    thickness: 1,
                    indent: 60,
                    endIndent: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: "01205535624"));

                      _launchURL("https://wa.me/201205535624");
                    },
                    child: box_widget(
                      text: "01205535624",
                      icon: Icon(Icons.phone, color: Colors.cyanAccent),
                    ),
                  ),

                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse("mailto:mahmoudayman202030@gmail"),
                      );
                    },
                    child: box_widget(
                      text: "mahmoudayman202030@gmail",

                      icon: Icon(Icons.mail, color: Colors.cyanAccent),
                    ),
                  ),
                  Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () =>
                            _launchURL('https://github.com/mahmud-ayman'),
                        child: Image.asset(
                          "assets/images/github-mark.png",
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(width: 40),
                      InkWell(
                        onTap: () => _launchURL(
                          'https://www.linkedin.com/in/mahmoud-ayman-ay1',
                        ),
                        child: Image.asset(
                          "assets/images/linkedin.png",
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
