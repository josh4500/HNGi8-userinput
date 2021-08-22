import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController;
  String userText = "";

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                ListTile(
                  leading: Image.asset(
                    "assets/images/github-logo.png",
                    height: 24,
                    width: 24,
                  ),
                  title: new Text('Built by Ajibola'),
                  onTap: () async {
                    if (await canLaunch("https://github.com/josh4500")) {
                      await launch("https:github.com/josh4500");
                    }
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/images/logo.png",
                    height: 24,
                    width: 24,
                  ),
                  title: Text('For HNG Intership 8 at zuri'),
                  onTap: () async {
                    if (await canLaunch("https://internship.zuri.team/")) {
                      await launch("https://internship.zuri.team/");
                    }
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/images/code-img.png",
                    height: 24,
                    width: 24,
                  ),
                  title: Text(
                    'Check the code at',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent,
                    ),
                  ),
                  onTap: () async {
                    if (await canLaunch(
                        "https://github.com/josh4500/HNGi8-userinput")) {
                      await launch(
                          "https://github.com/josh4500/HNGi8-userinput");
                    }
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(_size.width - 30, 70),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              title: Text(
                "HNGi8 - Internship",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              elevation: 16.0,
              shadowColor: Colors.black,
              backgroundColor: Colors.white.withOpacity(.9),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                )
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFF63C877),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40.0,
                  child: Text(
                    userText.length > 0
                        ? "$userText"
                        : "The display text is shown here...",
                    style: TextStyle(
                      color:
                          userText.length > 0 ? Colors.white : Colors.white54,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: _textEditingController,
                      enabled: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter text to display...",
                        contentPadding: const EdgeInsets.all(16.0),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _textEditingController.text = "";
                            setState(() {
                              userText = "";
                            });
                          },
                          icon: Icon(
                            Icons.close_outlined,
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      cursorColor: Colors.white12,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      userText = _textEditingController.text;
                    });
                    FocusScope.of(context).unfocus();
                  },
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                    minimumSize: MaterialStateProperty.all(
                      Size(double.infinity, 60),
                    ),
                    tapTargetSize: MaterialTapTargetSize.padded,
                    foregroundColor: MaterialStateProperty.all(Colors.green),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shadowColor: MaterialStateProperty.all(Colors.black54),
                    elevation: MaterialStateProperty.all(16.0),
                  ),
                  child: FittedBox(
                    child: Text(
                      "Display Text",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                SizedBox(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/hng-brand-logo.png",
                      scale: 1.8,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
