import 'package:flutter/material.dart';

import '../menu_screen.dart';

class Salary_Scrren extends StatefulWidget {
  const Salary_Scrren({Key? key}) : super(key: key);

  @override
  State<Salary_Scrren> createState() => _Salary_ScrrenState();
}

class _Salary_ScrrenState extends State<Salary_Scrren> {
  RangeValues sal = RangeValues(5000, 10000);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Salary Information"),
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
              title: Text("Salary Information"),
              collapsedBackgroundColor: Colors.grey,
              collapsedIconColor: Colors.grey,
              children: [
                SizedBox(height: 50),
                RangeSlider(
                  values: sal,
                  labels:
                      RangeLabels("${sal.start.round()}", "${sal.end.round()}"),
                  onChanged: (value) {
                    setState(() {
                      sal = value;
                    });
                  },
                  activeColor: Colors.black,
                  divisions: 10,
                  max: 50000,
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  alignment: Alignment.center,
                  child: Text(
                    "$sal",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
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
                    showDataList.add(sal);
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
