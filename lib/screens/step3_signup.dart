import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/screens/step4_signUp.dart';

class Step3SignUp extends StatefulWidget {
  const Step3SignUp({Key? key}) : super(key: key);
  static const routename = '/step3';

  @override
  State<Step3SignUp> createState() => _Step3SignUpState();
}

class _Step3SignUpState extends State<Step3SignUp> {
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
                value: 0.375,
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
                      "assets/images/frame2.png",
                      width: calculateSize(53),
                      height: calculateSize(53),
                    ),
                    appText("Smile $fname 📸️,", 20,
                        weight: FontWeight.w700,
                        topmargin: 15.0,
                        bottommargin: 5.0,
                        color: Color(0xff1D1A42)),
                    appText("It’s time to take a picture,", 20,
                        weight: FontWeight.w700, color: Color(0xff1D1A42)),
                    appText(
                      "Please upload or take a picture for your fans to easily recognize and book an experience",
                      15,
                      weight: FontWeight.w500,
                      topmargin: 5.0,
                      bottommargin: 50.0,
                      color: Color(0xff1D1A42),
                      align: TextAlign.start,
                    ),
                    GestureDetector(
                      onTap: passportimage,
                      child: pic == null
                          ? Center(
                              child: Image.asset(
                                "assets/images/frampic.png",
                                height: calculateSize(150),
                                width: calculateSize(150),
                              ),
                            )
                          : Center(
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: FileImage(pic!),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: calculateSize(100),
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
                            .pushNamed(step4SignUp.routeName, arguments: fname);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: calculateSize(50),
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
              ),
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
