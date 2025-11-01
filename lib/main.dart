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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/back_ground.png',
            ), // ← ضع صورتك هنا
            fit: BoxFit.cover, // تغطي الشاشة بالكامل
          ),
        ),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 1),

                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(83, 255, 255, 255),
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
                  SizedBox(height: 5),
                  Text(
                    'flutter developer | UI/UX',
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
                      icon: Icon(
                        Icons.phone,
                        color: const Color.fromARGB(146, 24, 255, 255),
                      ),
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

                      icon: Icon(
                        Icons.mail,
                        color: const Color.fromARGB(154, 24, 255, 255),
                      ),
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
                          color: const Color.fromARGB(143, 253, 255, 252),
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
                          color: const Color.fromARGB(143, 253, 255, 252),
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(
                          3.1416,
                        ), // تدوير 180 درجة حول المحور الرأسي X
                        child: Image.asset(
                          'assets/images/arrow.png',
                          color: const Color.fromARGB(171, 255, 255, 255),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 130),
                    ],
                  ),

                  Row(
                    children: [
                      InkWell(
                        onTap: () => _launchURL(
                          "https://www.canva.com/design/DAGz_FJ9tlY/oBvTTIf8zO3yQcB40xCe8g/edit?utm_content=DAGz_FJ9tlY&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
                        ),
                        child: Text(
                          'Portfolio',
                          style: GoogleFonts.pacifico(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(115, 255, 255, 255),
                              fontSize: 28,
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  color: Colors.black45,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                          ),
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
