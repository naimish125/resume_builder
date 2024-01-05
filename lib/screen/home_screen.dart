import 'package:flutter/material.dart';

class Home_Scrren extends StatefulWidget {
  const Home_Scrren({Key? key}) : super(key: key);

  @override
  State<Home_Scrren> createState() => _Home_ScrrenState();
}

class _Home_ScrrenState extends State<Home_Scrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Resume Builder App"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Account")),
              PopupMenuItem(child: Text("Settings")),
              PopupMenuItem(child: Text("Profile")),
              PopupMenuItem(child: Text("Help")),
              PopupMenuItem(child: Text("Log out")),
            ],
          )
        ],
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              Navigator.pushNamed(context, "Menu");
            });
          },
          child: Container(
            height: 70,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2),
            ),
            alignment: Alignment.center,
            child: Text(
              "Start Resume",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
