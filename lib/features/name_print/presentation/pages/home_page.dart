import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("HNGi8"),
          backgroundColor: Colors.black,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black87,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Text(
                          userText.length > 0
                              ? "$userText"
                              : "The display text is shown here...",
                          style: userText.length > 0
                              ? TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )
                              : TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                        ),
                      ),
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
                      border: Border.all(
                        color: Colors.black87,
                        width: 2,
                      ),
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
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  child: Container(
                    child: Text(
                      "Display",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
