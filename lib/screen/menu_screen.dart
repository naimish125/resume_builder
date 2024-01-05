import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/modal_data.dart';

List showDataList = [];

class Menu_Scrren extends StatefulWidget {
  const Menu_Scrren({Key? key}) : super(key: key);

  @override
  State<Menu_Scrren> createState() => _Menu_ScrrenState();
}

class _Menu_ScrrenState extends State<Menu_Scrren> {
  String? path;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Resume Builder App"),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                //image
                SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: path == null
                          ? CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/image/person.png"),
                              backgroundColor: Colors.grey,
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(File("$path")),
                              backgroundColor: Colors.grey,
                            ),
                    ),
                    InkWell(
                      onTap: () async {
                        ImagePicker i1 = ImagePicker();
                        XFile? xfile = await i1.pickImage(
                            source: ImageSource.camera, imageQuality: 50);
                        setState(() {
                          path = xfile!.path;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 140, left: 160),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.black54,
                          size: 40,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        ImagePicker i1 = ImagePicker();
                        XFile? xfile = await i1.pickImage(
                            source: ImageSource.gallery, imageQuality: 50);
                        setState(() {
                          path = xfile!.path;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 140),
                        child: Icon(
                          Icons.photo_library,
                          color: Colors.black54,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                //Text
                Text(
                  "Pick Your Image",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 20),
                //Option
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Personal');
                        },
                        child: Option(
                            "Personal\ninformation",
                            Icon(Icons.person,
                                color: Colors.black54, size: 45))),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "Quali");
                        },
                        child: Option("Qualification",
                            Icon(Icons.book, color: Colors.black54, size: 45))),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "Language");
                        },
                        child: Option(
                            "Know\nLanguage",
                            Icon(Icons.language,
                                color: Colors.black54, size: 45))),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "expi");
                        },
                        child: Option("Work\nExpirence",
                            Icon(Icons.work, color: Colors.black54, size: 45))),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "sal");
                        },
                        child: Option(
                            "Salary\nInformation",
                            Icon(Icons.currency_exchange,
                                color: Colors.black54, size: 45))),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "tec");
                        },
                        child: Option(
                            "Technical\nSkill",
                            Icon(Icons.spoke,
                                color: Colors.black54, size: 45))),
                  ],
                ),
                //Save
                SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        showDataList.isEmpty
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                      "First Enter All Data Line By Line",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    backgroundColor: Colors.black12,
                                    behavior: SnackBarBehavior.floating),
                              )
                            : print(showDataList);
                        Modal_data m1 = Modal_data(
                          path: path,
                          f_name: showDataList[0]!,
                          l_name: showDataList[1]!,
                          add: showDataList[2]!,
                          con: showDataList[3]!,
                          email: showDataList[4]!,
                          gen: showDataList[5]!,
                          nation: showDataList[6]!,
                          city: showDataList[7],
                          edu: showDataList[8],
                          lang: showDataList[9],
                          exp: showDataList[10],
                          sal: showDataList[11],
                          skill: showDataList[12],
                        );
                        Navigator.pushNamed(context, "show", arguments: m1);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Show data",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Data Clear Successfully",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            backgroundColor: Colors.black26,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        showDataList.clear();
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Clear data",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Option(String data, Icon i1) {
    return Container(
        height: 150,
        width: 167,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              i1,
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "$data",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Spacer(),
                  Icon(Icons.navigate_next, color: Colors.black54, size: 40),
                ],
              ),
            ],
          ),
        ));
  }

  void ExitDilog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Are Sure to Exit",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black38,
          content: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  exit(0);
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
