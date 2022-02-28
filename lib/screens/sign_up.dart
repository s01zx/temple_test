import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/providers/app_provider.dart';
import 'package:temple_test/screens/step2_signup.dart';

class SignUpScreen extends StatefulWidget {
  //const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/signUP";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<String> reportList = [];
  List<String> selectedReportList = [];
  final celebCat = TextEditingController();
  final _form = GlobalKey<FormState>();
  //final focusNode = FocusNode();

  String? firstName;

  String? cats;

  @override
  void initState() {
    //focusNode.addListener(testmethod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reportList = Provider.of<AppProvider>(context).repList;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: pageMargin,
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.grey),
                      onPressed: () => Navigator.of(context).pop()),
                  Center(
                    child: Image.asset(
                      "assets/images/39.png",
                      height: calculateSize(74),
                      width: calculateSize(100),
                    ),
                  ),
                  Center(
                    child: appText("Create an Account", 19,
                        weight: FontWeight.w700,
                        color: Colors.black,
                        topmargin: 10.0,
                        bottommargin: 5.0),
                  ),
                  Center(
                    child: appText(
                        "And access the richest collection of celebrities and amaze-ing people",
                        13,
                        weight: FontWeight.w400,
                        color: Color(0xff140432),
                        bottommargin: 30.0),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFieldWidget(
                          labelText: "First Name",
                          fxsavedValue: (val) {
                            firstName = val;
                          },
                          fx: (val) {
                            if (val!.trim().isEmpty) {
                              return " First name is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: calculateSize(20),
                      ),
                      Expanded(
                        child: AppTextFieldWidget(
                          labelText: "Last Name",
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: calculateSize(40),
                  ),
                  AppTextFieldWidget(
                    labelText: "Celebrity AKA",
                  ),
                  SizedBox(
                    height: calculateSize(40),
                  ),
                  AppTextFieldWidget(
                    labelText: "Email Address",
                  ),
                  SizedBox(
                    height: calculateSize(40),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffCBC8D2),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'Ng',
                            favorite: ['+234'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: calculateSize(20),
                      ),
                      Expanded(
                        flex: 2,
                        child: AppTextFieldWidget(
                          labelText: "Phone number",
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: calculateSize(40),
                  ),
                  AppTextFieldWidget(
                    labelText: "Country of Residence",
                  ),
                  SizedBox(
                    height: calculateSize(40),
                  ),
                  AppTextFieldWidget(
                    labelText: "City",
                  ),
                  SizedBox(
                    height: calculateSize(40),
                  ),
                  GestureDetector(
                    onTap: testmethod,
                    child: AppTextFieldWidget(
                      //enabled: false,
                      fxsavedValue: (val) {
                        cats = val;
                      },
                      fx: (val) {
                        if (val!.trim().isEmpty) {
                          return "Category is required";
                        }
                        return null;
                      },
                      controller: celebCat,
                      //focusNode: focusNode,
                      labelText: "Primary Celebrity Category",
                      trailingButton: IconButton(
                          icon: Icon(
                            Icons.add_circle_outlined,
                            color: Colors.green,
                          ),
                          onPressed: testmethod),
                    ),
                  ),
                  SizedBox(
                    height: calculateSize(40),
                  ),
                  AppTextFieldWidget(
                    labelText: "Password",
                  ),
                  SizedBox(height: calculateSize(15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      litleCOntainer("Capital letters"),
                      litleCOntainer("Lowercase letters"),
                      litleCOntainer("Special Characters"),
                    ],
                  ),
                  Center(
                    child: appText(
                        "By creating an account you agree to Amaze's", 14,
                        weight: FontWeight.w400,
                        topmargin: 16.0,
                        color: Colors.black,
                        bottommargin: 5.0),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                            color: Color(0xffE6007E),
                            fontWeight: FontWeight.w400,
                            fontSize: calculateSize(12),
                          ),
                          children: [
                            TextSpan(
                              text: " and ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: calculateSize(12),
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                color: Color(0xffE6007E),
                                fontWeight: FontWeight.w400,
                                fontSize: calculateSize(12),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      var isvalid = _form.currentState!.validate();
                      if (!isvalid) {
                        return;
                      }
                      _form.currentState!.save();
                      Navigator.of(context)
                          .pushNamed(Step2.routeName, arguments: firstName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: calculateSize(20), bottom: calculateSize(30)),
                      width: double.infinity,
                      height: calculateSize(57),
                      decoration: BoxDecoration(
                        color: Color(0xff140432),
                        borderRadius: BorderRadius.circular(calculateSize(50)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                height: double.infinity,
                                width: calculateSize(55),
                                child: Icon(Icons.email_rounded),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: appText("Continue", 15,
                                weight: FontWeight.w600,
                                color: Colors.white,
                                align: TextAlign.center),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> testmethod() async {
    FocusScope.of(context).unfocus();
    if (reportList.isNotEmpty) {
      showMaterialModalBottomSheet(
        expand: false,
        elevation: 5.0,
        isDismissible: false,
        barrierColor: Color(0xff1D1A40).withOpacity(0.8),
        context: context,
        animationCurve: Curves.bounceInOut,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          //height: MediaQuery.of(context).size.height * 0.40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                calculateSize(20),
              ),
              topRight: Radius.circular(
                calculateSize(20),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: calculateSize(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      )),
                ),
                Image.asset(
                  "assets/images/Group 944.png",
                  height: calculateSize(90),
                  width: calculateSize(90),
                ),
                appText("Primary Celebrity Category", 17,
                    weight: FontWeight.w700,
                    color: Color(0xff1D1A42),
                    topmargin: 15.0,
                    bottommargin: 10.0),
                appText(
                  "Please select a primary celebrity category that defines your offering",
                  13,
                  weight: FontWeight.w500,
                  color: Color(0xff76768D),
                ),
                MultiSelectChip(
                  reportList,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedReportList = selectedList;
                    });
                  },
                  maxSelection: 1,
                ),
                GestureDetector(
                  onTap: () {
                    celebCat.text = selectedReportList.join(" , ");
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: calculateSize(25),
                        right: calculateSize(25),
                        top: calculateSize(30)),
                    width: double.infinity,
                    height: calculateSize(57),
                    decoration: BoxDecoration(
                      color: Color(0xffE6007E),
                      borderRadius: BorderRadius.circular(
                        calculateSize(50),
                      ),
                    ),
                    child: appText("Select Category", 15,
                        weight: FontWeight.w600, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      setState(() {
        showLoading(context);
      });
      try {
        await Provider.of<AppProvider>(context, listen: false).getCelebCat();
        reportList = Provider.of<AppProvider>(context, listen: false).repList;

        setState(() {
          Navigator.of(context).pop();
        });
        showMaterialModalBottomSheet(
          expand: false,
          elevation: 5.0,
          isDismissible: false,
          barrierColor: Color(0xff1D1A40).withOpacity(0.8),
          context: context,
          animationCurve: Curves.bounceInOut,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            //height: MediaQuery.of(context).size.height * 0.40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  calculateSize(20),
                ),
                topRight: Radius.circular(
                  calculateSize(20),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: calculateSize(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.grey,
                        )),
                  ),
                  Image.asset(
                    "assets/images/Group 944.png",
                    height: calculateSize(90),
                    width: calculateSize(90),
                  ),
                  appText("Primary Celebrity Category", 17,
                      weight: FontWeight.w700,
                      color: Color(0xff1D1A42),
                      topmargin: 15.0,
                      bottommargin: 10.0),
                  appText(
                    "Please select a primary celebrity category that defines your offering",
                    13,
                    weight: FontWeight.w500,
                    color: Color(0xff76768D),
                  ),
                  MultiSelectChip(
                    reportList,
                    onSelectionChanged: (selectedList) {
                      setState(() {
                        selectedReportList = selectedList;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      celebCat.text = selectedReportList.join(" , ");
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          left: calculateSize(25),
                          right: calculateSize(25),
                          top: calculateSize(30)),
                      width: double.infinity,
                      height: calculateSize(57),
                      decoration: BoxDecoration(
                        color: Color(0xffE6007E),
                        borderRadius: BorderRadius.circular(
                          calculateSize(50),
                        ),
                      ),
                      child: appText("Select Category", 15,
                          weight: FontWeight.w600, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } on Exception catch (e) {
        setState(() {
          Navigator.of(context).pop();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>)? onSelectionChanged;
  final Function(List<String>)? onMaxSelected;
  final int? maxSelection;
  MultiSelectChip(this.reportList,
      {this.onSelectionChanged, this.maxSelection, this.onMaxSelected});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // bool isSelected = false;
  // String selectedChoice = "";
  List<String> selectedChoices = [];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: Color.fromRGBO(230, 0, 126, 0.05),
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            if (selectedChoices.length == (widget.maxSelection ?? -1) &&
                !selectedChoices.contains(item)) {
              widget.onMaxSelected?.call(selectedChoices);
            } else {
              setState(() {
                selectedChoices.contains(item)
                    ? selectedChoices.remove(item)
                    : selectedChoices.add(item);
                widget.onSelectionChanged!(selectedChoices);
              });
            }
          },
        ),
      ));
    });
    return choices;
  }
}

class litleCOntainer extends StatelessWidget {
  //const litleCOntainer({ Key? key }) : super(key: key);

  final tx;

  const litleCOntainer(this.tx);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: calculateSize(5)),
      decoration: BoxDecoration(
          color: Color.fromRGBO(41, 155, 1, 0.05),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: Color(0xff299B01),
          ),
          appText(tx, 13, weight: FontWeight.w400)
        ],
      ),
    );
  }
}
