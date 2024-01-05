import 'package:flutter/material.dart';

import '../menu_screen.dart';

class Expirence_Scrren extends StatefulWidget {
  const Expirence_Scrren({Key? key}) : super(key: key);

  @override
  State<Expirence_Scrren> createState() => _Expirence_ScrrenState();
}

class _Expirence_ScrrenState extends State<Expirence_Scrren> {
  List exList = ["Fresher", "1 Year", "2 Year", "3 Year", "4 Year", "5 Year"];
  String? a;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Job Expirence"),
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
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Job Expirence"),
              trailing: Icon(Icons.edit),
              tileColor: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                  items: exList
                      .map((e) => DropdownMenuItem(
                            child: Text("$e"),
                            value: e,
                          ))
                      .toList(),
                  value: a,
                  hint: Center(
                      child: Text(
                    "----- Select -----",
                    style: TextStyle(fontSize: 18, color: Colors.black12),
                  )),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      a = value as String;
                    });
                  }),
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
                showDataList.add(a);
                Navigator.pop(context);
                print(a);
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
