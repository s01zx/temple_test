import 'package:flutter/material.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/screens/step6_signUp.dart';

class Step5SignUp extends StatefulWidget {
  const Step5SignUp({Key? key}) : super(key: key);
  static const routeName = "/step5";

  @override
  State<Step5SignUp> createState() => _Step5SignUpState();
}

class _Step5SignUpState extends State<Step5SignUp> {
  final amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
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
                value: 0.625,
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
                      "assets/images/Frame 4.png",
                      width: calculateSize(53),
                      height: calculateSize(53),
                    ),
                    appText("Cha-Ching $fname 💵️,", 20,
                        weight: FontWeight.w700,
                        topmargin: 15.0,
                        bottommargin: 5.0,
                        color: Color(0xff1D1A42)),
                    appText("Time to put a price on it,", 20,
                        weight: FontWeight.w700, color: Color(0xff1D1A42)),
                    appText(
                      "Please set a price you’d like your fans to pay for your service",
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
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffE6007E),
                        borderRadius: BorderRadius.circular(
                          calculateSize(6),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: calculateSize(12.5),
                            vertical: calculateSize(7.5)),
                        child: appText("Video ShoutOut - Fans", 13,
                            weight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: calculateSize(22),
                    ),
                    AppTextFieldWidget(
                      controller: amountController,
                      labelText: "Enter preferred amount",
                      prefixText: "N ",
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: calculateSize(9),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(118, 118, 141, 0.1),
                        borderRadius: BorderRadius.circular(
                          calculateSize(5),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: calculateSize(12.5),
                            vertical: calculateSize(7.5)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: appText(
                                  "We recommend a minimum price of ₦100,000 and maximum price of ₦1,000,000  for video shoutout - fans",
                                  13,
                                  weight: FontWeight.w500,
                                  leftmargin: 10.0,
                                  color: Color(0xff76768D),
                                  align: TextAlign.start),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (amountController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Enter amount"),
                              duration: Duration(seconds: 3),
                            ),
                          );

                          return;
                        }

                        Navigator.of(context)
                            .pushNamed(Step6SignUp.routeName, arguments: fname);
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
