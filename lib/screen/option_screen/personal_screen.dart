import 'package:flutter/material.dart';

import '../menu_screen.dart';

class Personal extends StatefulWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  TextEditingController txtfname = TextEditingController();
  TextEditingController txtlname = TextEditingController();
  TextEditingController txtaddresh = TextEditingController();
  TextEditingController txtcontact = TextEditingController();
  TextEditingController txtemail = TextEditingController();

  bool a = false, b = true;
  List city = [
    "Surat",
    "Ahmedabad",
    "Vadodara",
    "Amorally",
    "Baroda",
    "gandhi nagar",
    "Other",
    "Other",
  ];

  String Gender = "Male";
  String con = "India";
  String? c;
  String? f_name;

  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: WillPopScope(
        onWillPop: back,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12,
            title: Text("Personal Information"),
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
            child: Column(
              children: [
                ExpansionTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Personal information",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  collapsedBackgroundColor: Colors.grey,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          //first
                          TextFormField(
                            style: TextStyle(fontSize: 18),
                            controller: txtfname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The Name";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              label: Text(
                                "First Name",
                                style: TextStyle(color: Colors.black),
                              ),
                              suffixIcon: Icon(
                                Icons.account_box_outlined,
                                size: 30,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          //second
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(fontSize: 18),
                            controller: txtlname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The Name";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              label: Text(
                                "Last Name",
                                style: TextStyle(color: Colors.black),
                              ),
                              suffixIcon: Icon(
                                Icons.account_box_outlined,
                                size: 30,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          //address
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(fontSize: 18),
                            controller: txtaddresh,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The Address";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              label: Text(
                                "Address",
                                style: TextStyle(color: Colors.black),
                              ),
                              suffixIcon: Icon(
                                Icons.home,
                                size: 30,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          //contact
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(fontSize: 18),
                            controller: txtcontact,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The contact";
                              } else if (value.length != 10) {
                                return "Only 10 Digit Are Available";
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              label: Text(
                                "Contact",
                                style: TextStyle(color: Colors.black),
                              ),
                              suffixIcon: Icon(
                                Icons.call,
                                size: 30,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          //E mail
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(fontSize: 18),
                            keyboardType: TextInputType.emailAddress,
                            controller: txtemail,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The E-mail";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.black,
                              )),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              label: Text(
                                "E-Mail",
                                style: TextStyle(color: Colors.black),
                              ),
                              suffixIcon: Icon(
                                Icons.mail,
                                size: 30,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          //Gender
                          SizedBox(height: 10),
                          ExpansionTile(
                            title: Text("Select Gender"),
                            collapsedIconColor: Colors.grey,
                            collapsedBackgroundColor: Colors.grey.shade300,
                            children: [
                              RadioListTile(
                                value: "Male",
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value!;
                                  });
                                },
                                activeColor: Colors.black,
                                title: Text("Male"),
                              ),
                              RadioListTile(
                                value: "Female",
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value!;
                                  });
                                },
                                activeColor: Colors.black87,
                                title: Text("Female"),
                              ),
                              RadioListTile(
                                value: "Other",
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value!;
                                  });
                                },
                                activeColor: Colors.black,
                                title: Text("Other"),
                              ),
                            ],
                          ),
                          //Contre
                          SizedBox(height: 10),
                          ExpansionTile(
                            title: Text("Select Nationality"),
                            collapsedIconColor: Colors.grey,
                            collapsedBackgroundColor: Colors.grey.shade300,
                            children: [
                              RadioListTile(
                                value: "India",
                                groupValue: con,
                                onChanged: (value) {
                                  setState(() {
                                    con = value!;
                                  });
                                },
                                activeColor: Colors.black,
                                title: Text("India"),
                              ),
                              RadioListTile(
                                value: "America",
                                groupValue: con,
                                onChanged: (value) {
                                  setState(() {
                                    con = value!;
                                  });
                                },
                                activeColor: Colors.black,
                                title: Text("America"),
                              ),
                              RadioListTile(
                                value: "Russia",
                                groupValue: con,
                                onChanged: (value) {
                                  setState(() {
                                    con = value!;
                                  });
                                },
                                activeColor: Colors.black,
                                title: Text("Russia"),
                              ),
                            ],
                          ),
                          //city
                          SizedBox(height: 10),
                          Text(
                            "Enter The City",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: 60,
                            child: DropdownButton(
                              items: city
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              value: c,
                              hint: Center(
                                  child: Text(
                                "----- Select -----",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              )),
                              isExpanded: true,
                              focusColor: Colors.black,
                              onChanged: (value) {
                                setState(() {
                                  c = value as String;
                                });
                              },
                            ),
                          ),
                          //Save
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              if (txtkey.currentState!.validate()) {
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
                                showDataList.add(txtfname.text);
                                showDataList.add(txtlname.text);
                                showDataList.add(txtaddresh.text);
                                showDataList.add(txtcontact.text);
                                showDataList.add(txtemail.text);
                                showDataList.add(Gender);
                                showDataList.add(con);
                                showDataList.add(c);
                                Navigator.pop(context);
                              }
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
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
