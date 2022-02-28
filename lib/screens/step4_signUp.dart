import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/screens/step5_signUp.dart';

class step4SignUp extends StatefulWidget {
  const step4SignUp({Key? key}) : super(key: key);
  static const routeName = '/step4';

  @override
  State<step4SignUp> createState() => _step4SignUpState();
}

class _step4SignUpState extends State<step4SignUp> {
  File? vid;
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
                value: 0.5,
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
                      "assets/images/Frame 3.png",
                      width: calculateSize(53),
                      height: calculateSize(53),
                    ),
                    appText("Hooray $fname 🎉️,,", 20,
                        weight: FontWeight.w700,
                        topmargin: 15.0,
                        bottommargin: 5.0,
                        color: Color(0xff1D1A42)),
                    appText("We are almost there!!,", 20,
                        weight: FontWeight.w700, color: Color(0xff1D1A42)),
                    appText(
                      "Please select the service(s) you choose to offer on Amaze",
                      15,
                      weight: FontWeight.w500,
                      topmargin: 5.0,
                      bottommargin: 33.0,
                      color: Color(0xff1D1A42),
                      align: TextAlign.start,
                    ),
                    InkResponse(
                      onTap: passportimage,
                      child: Container(
                        width: double.infinity,
                        height: calculateSize(115),
                        decoration: BoxDecoration(
                          color: vid == null
                              ? Colors.transparent
                              : Color(0xffFEF2F9),
                          border: Border.all(color: Color(0xffE3E0E0)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                appText(
                                  "Video ShoutOut - Fans",
                                  17,
                                  weight: FontWeight.w700,
                                  leftmargin: 15.0,
                                  color: Color(0xffA5A3B2),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(right: calculateSize(15)),
                                  height: calculateSize(20),
                                  width: calculateSize(20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Color(0xffE3E0E0),
                                    ),
                                  ),
                                  child: vid == null
                                      ? null
                                      : Padding(
                                          padding: EdgeInsets.all(1.5),
                                          child: Container(
                                            height: calculateSize(20),
                                            width: calculateSize(20),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffE6007E),
                                              // border: Border.all(
                                              //   color: Color(0xffE3E0E0),
                                              // ),
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                            appText(
                                "Create personalised videos for your fans and leave them Amaze-d.",
                                15,
                                leftmargin: 15.0,
                                rightmargin: 15.0,
                                color: Color(0xffA5A3B2),
                                weight: FontWeight.w500,
                                align: TextAlign.start),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: calculateSize(150),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (vid == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Kindly upload your video"),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          return;
                        }
                        Navigator.of(context)
                            .pushNamed(Step5SignUp.routeName, arguments: fname);
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
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        vid = File(pickedFile.path);
        //print(passport);
      } else {
        //print('No image selected.');
        return;
      }
    });
  }
}
