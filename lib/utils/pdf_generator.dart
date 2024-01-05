import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../model/modal_data.dart';

Future<Uint8List> GeneratePDF(Modal_data m1) async {
  var PDF = pw.Document();

  PDF.addPage(
    pw.Page(
      margin: pw.EdgeInsets.all(10),
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      build: (context) {
        return pw.Container(
          height: double.infinity,
          width: double.infinity,
          decoration: pw.BoxDecoration(
            borderRadius: pw.BorderRadius.circular(10),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Stack(
                children: [
                  pw.Container(
                    height: 100,
                    width: 100,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.black,
                      borderRadius: pw.BorderRadius.only(
                          topLeft: pw.Radius.circular(10),
                          bottomRight: pw.Radius.circular(500)),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5, left: 2),
                    child: pw.ClipOval(
                      child: pw.Image(
                          pw.MemoryImage(
                            File("${m1.path}").readAsBytesSync(),
                          ),
                          width: 130,
                          height: 130),
                    ),
                  ),

                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 100, top: 25),
                    child: pw.Container(
                      height: 50,
                      width: 50,
                      decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle, color: PdfColors.black),
                    ),
                  ),
                  //Personal
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 10, left: 160),
                    child: pw.Text(
                      "Personal Information",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 40, left: 160),
                    child: pw.Expanded(
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          Box("  First name :  ${m1.f_name}"),
                          pw.SizedBox(height: 8),
                          Box("  Last name :  ${m1.l_name}"),
                          pw.SizedBox(height: 8),
                          Box("  Address :  ${m1.add}"),
                          pw.SizedBox(height: 8),
                          Box("  Contact :  ${m1.con}"),
                          pw.SizedBox(height: 8),
                          Box("  E-Mail :  ${m1.email}"),
                          pw.SizedBox(height: 8),
                          Box("  Gender :  ${m1.gen}"),
                          pw.SizedBox(height: 8),
                          Box("  Nationality :  ${m1.nation}"),
                          pw.SizedBox(height: 8),
                          Box("  City :  ${m1.city}"),
                        ],
                      ),
                    ),
                  ),
                  //Education
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 130, left: 5),
                    child: pw.Text(
                      "Education Colification",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 155, left: 5),
                    child: pw.Container(
                      width: 150,
                      child: pw.Column(
                        children: [Box("  Education :  ${m1.edu}")],
                      ),
                    ),
                  ),
                  //Language
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 200, left: 5),
                    child: pw.Text(
                      "Know Language",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 230, left: 5),
                    child: pw.Container(
                      width: 150,
                      child: pw.Column(
                        children: [
                          pw.Container(
                            height: 50,
                            decoration: pw.BoxDecoration(
                                borderRadius: pw.BorderRadius.circular(10),
                                border: pw.Border.all(color: PdfColors.black)),
                            alignment: pw.Alignment.center,
                            child: pw.Text("Language : \n ${m1.lang}"),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Expirence
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 290, left: 5),
                    child: pw.Text(
                      "Job Expirence",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 310, left: 5),
                    child: pw.Container(
                      width: 150,
                      child: pw.Column(
                        children: [
                          Box(" Expirence :  ${m1.exp}"),
                        ],
                      ),
                    ),
                  ),
                  //About Me
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 350, left: 5),
                    child: pw.Text(
                      "About Me :",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 15,
                          color: PdfColors.black),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 370, left: 5),
                    child: pw.Text("   My name is naimish "),
                  ),
                  //Salary
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 480, left: 5),
                    child: pw.Text(
                      "Minimum Salary",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 15,
                          color: PdfColors.black),
                    ),
                  ),
                  pw.Padding(
                    padding:
                        const pw.EdgeInsets.only(top: 510, left: 5, right: 5),
                    child: Box("  Salary  :  ${m1.sal}"),
                  ),
                  //Skill
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 550, left: 5),
                    child: pw.Text(
                      "Technical Skill",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  pw.Padding(
                    padding:
                        const pw.EdgeInsets.only(top: 580, left: 5, right: 5),
                    child: pw.Column(
                      children: [
                        pw.Container(
                          height: 50,
                          width: double.infinity,
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(10),
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Text("  Skill : \n     ${m1.skill}"),
                        ),
                      ],
                    ),
                  ),
                  //declaration
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 635, left: 5),
                    child: pw.Text(
                      "Declaration :",
                      style: pw.TextStyle(
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 650),
                    child: pw.Text(
                        "     I hereby declare that all the details provided above are true to the best of my knowledge."),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 710, left: 290),
                    child: Box("  Sign  :  ${m1.f_name}"),
                  )
                ],
              ),
            ],
          ),
        );
      },
    ),
  );

  return await PDF.save();
}

pw.Widget Box(String data) {
  return pw.Container(
    height: 30,
    width: double.infinity,
    decoration: pw.BoxDecoration(
        borderRadius: pw.BorderRadius.circular(10),
        border: pw.Border.all(color: PdfColors.black)),
    alignment: pw.Alignment.centerLeft,
    child: pw.Text(
      "$data",
      style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold, color: PdfColors.black.shade(54)),
    ),
  );
}
