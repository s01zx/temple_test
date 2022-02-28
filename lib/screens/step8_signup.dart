import 'package:flutter/material.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/screens/done.dart';

class SignUp8 extends StatefulWidget {
  const SignUp8({Key? key}) : super(key: key);
  static const routeName = '/step8';

  @override
  State<SignUp8> createState() => _SignUp8State();
}

class _SignUp8State extends State<SignUp8> {
  final instaController = TextEditingController();
  final fcbkController = TextEditingController();
  final twiController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    instaController.dispose();
    fcbkController.dispose();
    twiController.dispose();
    super.dispose();
  }

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
                value: 1.0,
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
                      "assets/images/Frame8.png",
                      width: calculateSize(53),
                      height: calculateSize(53),
                    ),
                    appText("Done $fname ⛱️️,", 20,
                        weight: FontWeight.w700,
                        topmargin: 15.0,
                        bottommargin: 5.0,
                        color: Color(0xff1D1A42)),
                    appText("Personal social accounts,", 20,
                        weight: FontWeight.w700, color: Color(0xff1D1A42)),
                    appText(
                      "Please enter the url and/or identification for your social media accounts (optional)",
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
                    AppTextFieldWidget(
                      labelText: "Website(Optional)",
                      //prefixText: "N ",
                    ),
                    SizedBox(
                      height: calculateSize(30),
                    ),
                    AppTextFieldWidget(
                      controller: instaController,
                      labelText: "Instagram",
                      prefixIcon: Image.asset("assets/images/instagram.png"),
                      //prefixText: "N ",
                    ),
                    SizedBox(
                      height: calculateSize(30),
                    ),
                    AppTextFieldWidget(
                      controller: twiController,
                      labelText: "Twitter",
                      prefixIcon: Image.asset("assets/images/twitter.png"),
                      //prefixText: "N ",
                    ),
                    SizedBox(
                      height: calculateSize(30),
                    ),
                    AppTextFieldWidget(
                      controller: fcbkController,
                      labelText: "Facebook",
                      prefixIcon: Image.asset("assets/images/facebook.png"),
                      //prefixText: "N ",
                    ),
                    GestureDetector(
                      onTap: () {
                        if (fcbkController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Kindly input facebook details"),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          return;
                        }

                        if (instaController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Kindly input instagram details"),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          return;
                        }

                        if (twiController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Kindly input twitter details"),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          return;
                        }

                        Navigator.of(context).pushNamed(Done.routeName);
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
}
