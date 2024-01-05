import 'package:flutter/material.dart';

import '../menu_screen.dart';

class Technical_Scrren extends StatefulWidget {
  const Technical_Scrren({Key? key}) : super(key: key);

  @override
  State<Technical_Scrren> createState() => _Technical_ScrrenState();
}

class _Technical_ScrrenState extends State<Technical_Scrren> {
  List ski = [false, false, false, false, false];
  bool a = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Technical Skill"),
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
                "Technical Skill",
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
                  value: ski[0],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      ski[0] = value!;
                    });
                  },
                  title: Text("Flutter Developer"),
                ),
                //2
                CheckboxListTile(
                  value: ski[1],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      ski[1] = value!;
                    });
                  },
                  title: Text("Web development"),
                ),
                //3
                CheckboxListTile(
                  value: ski[2],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      ski[2] = value!;
                    });
                  },
                  title: Text("Bookkeeping"),
                ),
                //4
                CheckboxListTile(
                  value: ski[3],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      ski[3] = value!;
                    });
                  },
                  title: Text("UX design"),
                ),
                //5
                CheckboxListTile(
                  value: ski[4],
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      ski[4] = value!;
                    });
                  },
                  title: Text("Data analysis"),
                ),
                //Save
                SizedBox(height: 20),
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

                    var Skill = "";
                    if (ski[0]) {
                      Skill = "$Skill Flutter Developer";
                    }
                    if (ski[1]) {
                      Skill = "$Skill Web development";
                    }
                    if (ski[2]) {
                      Skill = "$Skill Bookkeeping";
                    }
                    if (ski[3]) {
                      Skill = "$Skill UX design";
                    }
                    if (ski[4]) {
                      Skill = "$Skill Data analysis";
                    }

                    showDataList.add(Skill);

                    Navigator.pop(context);
                    print(Skill);
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
                SizedBox(height: 20),
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
