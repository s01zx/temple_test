import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/providers/app_provider.dart';
import 'package:temple_test/screens/sign_up.dart';
import 'package:temple_test/screens/step3_signup.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);
  static const routeName = '/step2';

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  List<String> reportList = [];

  List<String> selectedReportList = [];

  @override
  Widget build(BuildContext context) {
    var fname = ModalRoute.of(context)!.settings.arguments as String;
    reportList = Provider.of<AppProvider>(context).repList;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                value: 0.25,
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
                      "assets/images/Frame 1.png",
                      width: calculateSize(53),
                      height: calculateSize(53),
                    ),
                    appText("Perfect $fname 😎️,", 20,
                        weight: FontWeight.w700,
                        topmargin: 15.0,
                        bottommargin: 5.0,
                        color: Color(0xff1D1A42)),
                    appText("Getting closer to meeting your fans,", 20,
                        weight: FontWeight.w700, color: Color(0xff1D1A42)),
                    appText(
                      "Please select a maximum of 5 secondary celebrity category that your fans can use to identify you",
                      15,
                      weight: FontWeight.w500,
                      topmargin: 5.0,
                      bottommargin: 30.0,
                      color: Color(0xff1D1A42),
                      align: TextAlign.start,
                    ),
                    MultiSelectChip(
                      reportList,
                      onSelectionChanged: (selectedList) {
                        setState(() {
                          selectedReportList = selectedList;
                        });
                      },
                      maxSelection: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (selectedReportList.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Kindly select at least 1 category"),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          return;
                        }
                        Navigator.of(context)
                            .pushNamed(Step3SignUp.routename, arguments: fname);
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
}
