import 'package:flutter/material.dart';

import '../menu_screen.dart';

class Language_Scrren extends StatefulWidget {
  const Language_Scrren({Key? key}) : super(key: key);

  @override
  State<Language_Scrren> createState() => _Language_ScrrenState();
}

class _Language_ScrrenState extends State<Language_Scrren> {
  List language = ["", "", "", "", ""];
  List sel = [false, false, false, false, false];
  bool a = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Known Language"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => const [
                PopupMenuItem(child: Text("Account")),
                PopupMenuItem(child: Text("Settings")),
                PopupMenuItem(child: Text("Profile")),
                PopupMenuItem(child: Text("Help")),
                PopupMenuItem(child: Text("Log out")),
              ],
            )
          ],
        ),
        body: Column(
          children: [
            ExpansionTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                "Known Language",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.black,
              ),
              collapsedBackgroundColor: Colors.grey,
              children: [
                //1
                CheckboxListTile(
                  value: sel[0],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      sel[0] = value!;
                    });
                  },
                  title: Text("Gujarati"),
                ),
                //2
                CheckboxListTile(
                  value: sel[1],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      sel[1] = value!;
                    });
                  },
                  title: Text("Hindi"),
                ),
                //3
                CheckboxListTile(
                  value: sel[2],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      sel[2] = value!;
                    });
                  },
                  title: Text("English"),
                ),
                //4
                CheckboxListTile(
                  value: sel[3],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      sel[3] = value!;
                    });
                  },
                  title: Text("Marathi"),
                ),
                //5
                CheckboxListTile(
                  value: sel[4],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      sel[4] = value!;
                    });
                  },
                  title: Text("Other"),
                ),
                //Save
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Data Save Successfully",
                          style: TextStyle(fontSize: 15),
                        ),
                        backgroundColor: Colors.black12,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );

                    var Language = "";
                    if (sel[0]) {
                      Language = "$Language Gujarati";
                    }
                    if (sel[1]) {
                      Language = "$Language Hindi";
                    }
                    if (sel[2]) {
                      Language = "$Language English";
                    }
                    if (sel[3]) {
                      Language = "$Language Marathi";
                    }
                    if (sel[4]) {
                      Language = "$Language Other";
                    }

                    showDataList.add(Language);

                    Navigator.pop(context);
                    print(showDataList);
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Save data & Back",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void ExitDilog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Are Sure to Exit\nWhen you Exit Your Enter Data Remove",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black38,
          content: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("Yes"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          ),
        );
      },
    );
  }

  Future<bool> back() async {
    ExitDilog();

    return await false;
  }
}
