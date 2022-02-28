import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/screens/step8_signup.dart';

class Step7SignUp extends StatefulWidget {
  const Step7SignUp({Key? key}) : super(key: key);
  static const routeName = '/step7';

  @override
  State<Step7SignUp> createState() => _Step7SignUpState();
}

class _Step7SignUpState extends State<Step7SignUp> {
  File? pic;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    var fname = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: calculateSize(25),
              ),
              Padding(
                padding: EdgeInsets.only(left: calculateSize(28)),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.grey),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(
                height: calculateSize(15),
              ),
              const LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xffE6007E),
                ),
                value: 0.87,
                minHeight: 1.5,
              ),
              Container(
                margin: pageMargin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: calculateSize(20),
                    ),
                    Image.asset(
                      "assets/images/Frame7.png",
                      width: calculateSize(53),
                      height: calculateSize(53),
                    ),
                    appText("Finally $fname 🤙️️,", 20,
                        weight: FontWeight.w700,
                        topmargin: 15.0,
                        bottommargin: 5.0,
                        color: Color(0xff1D1A42)),
                    appText("Additional information required,", 20,
                        weight: FontWeight.w700, color: Color(0xff1D1A42)),
                    appText(
                      "Please upload necessary additional information to avoid duplicacy of your identity",
                      15,
                      weight: FontWeight.w500,
                      topmargin: 5.0,
                      bottommargin: 33.0,
                      color: Color(0xff1D1A42),
                      align: TextAlign.start,
                    ),
                    SizedBox(
                      height: calculateSize(40),
                    ),
                    Row(
                      children: [
                        appText("Identification Document", 13,
                            weight: FontWeight.w500,
                            color: Color(0xff76768D),
                            rightmargin: 10.0),
                        Icon(
                          Icons.info_rounded,
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: calculateSize(5),
                    ),
                    GestureDetector(
                      onTap: passportimage,
                      child: pic == null
                          ? Container(
                              height: calculateSize(50),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff76768D),
                                ),
                                borderRadius:
                                    BorderRadius.circular(calculateSize(6)),
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: appText("Upload", 13,
                                    weight: FontWeight.w700,
                                    color: Colors.green,
                                    rightmargin: 20.0),
                              ),
                            )
                          : Center(
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: FileImage(pic!),
                              ),
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (pic == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Kindly upload your pic"),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          return;
                        }
                        Navigator.of(context)
                            .pushNamed(SignUp8.routeName, arguments: fname);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: calculateSize(70),
                              bottom: calculateSize(30)),
                          width: double.infinity,
                          height: calculateSize(57),
                          decoration: BoxDecoration(
                            color: Color(0xff140432),
                            borderRadius:
                                BorderRadius.circular(calculateSize(50)),
                          ),
                          child: appText("Save and Continue", 15,
                              weight: FontWeight.w600,
                              color: Colors.white,
                              align: TextAlign.center)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> passportimage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      //imageQuality: 100,
    );

    setState(() {
      if (pickedFile != null) {
        pic = File(pickedFile.path);
        //print(passport);
      } else {
        //print('No image selected.');
        return;
      }
    });
  }
}
