import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/screens/step7_signUP.dart';

class Step6SignUp extends StatefulWidget {
  //const Step6SignUp({Key? key}) : super(key: key);
  static const routeName = '/step6';

  @override
  State<Step6SignUp> createState() => _Step6SignUpState();
}

class _Step6SignUpState extends State<Step6SignUp> {
  bool isVisible = true;
  final accountController = TextEditingController();
  Map<String, dynamic>? _selectedItembank;

  List<DropdownMenuItem<Map<String, dynamic>>>? _dropdownMenuItemsbank;

  final List<Map<String, dynamic>> _dropdownItemsbank = [
    {"id": "1", "name": "Access Bank", "code": "044"},
    {"id": "2", "name": "Citibank", "code": "023"},
    {"id": "3", "name": "Diamond Bank", "code": "063"},
    {"id": "4", "name": "Dynamic Standard Bank", "code": ""},
    {"id": "5", "name": "Ecobank Nigeria", "code": "050"},
    {"id": "6", "name": "Fidelity Bank Nigeria", "code": "070"},
    {"id": "7", "name": "First Bank of Nigeria", "code": "011"},
    {"id": "8", "name": "First City Monument Bank", "code": "214"},
    {"id": "9", "name": "Guaranty Trust Bank", "code": "058"},
    {"id": "10", "name": "Heritage Bank Plc", "code": "030"},
    {"id": "11", "name": "Jaiz Bank", "code": "301"},
    {"id": "12", "name": "Keystone Bank Limited", "code": "082"},
    {"id": "13", "name": "Providus Bank Plc", "code": "101"},
    {"id": "14", "name": "Polaris Bank", "code": "076"},
    {"id": "15", "name": "Stanbic IBTC Bank Nigeria Limited", "code": "221"},
    {"id": "16", "name": "Standard Chartered Bank", "code": "068"},
    {"id": "17", "name": "Sterling Bank", "code": "232"},
    {"id": "18", "name": "Suntrust Bank Nigeria Limited", "code": "100"},
    {"id": "19", "name": "Union Bank of Nigeria", "code": "032"},
    {"id": "20", "name": "United Bank for Africa", "code": "033"},
    {"id": "21", "name": "Unity Bank Plc", "code": "215"},
    {"id": "22", "name": "Wema Bank", "code": "035"},
    {"id": "23", "name": "Zenith Bank", "code": "057"}
  ];

  @override
  void initState() {
    _dropdownMenuItemsbank = buildDropDownMenuItems(_dropdownItemsbank);
    super.initState();
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
                value: 0.75,
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
                      "assets/images/Frame6.png",
                      width: calculateSize(53),
                      height: calculateSize(53),
                    ),
                    appText("Almost $fname ⚙️️,", 20,
                        weight: FontWeight.w700,
                        topmargin: 15.0,
                        bottommargin: 5.0,
                        color: Color(0xff1D1A42)),
                    appText("Set up your withdrawal account,", 20,
                        weight: FontWeight.w700, color: Color(0xff1D1A42)),
                    appText(
                      "Please set up your preferred withdrawal account and we’ll direct your funds to it",
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
                    Visibility(
                      visible: isVisible,
                      replacement: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: calculateSize(22),
                            vertical: calculateSize(17)),
                        height: calculateSize(105),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                            calculateSize(12),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/gt.png",
                              width: calculateSize(30),
                              height: calculateSize(30),
                            ),
                            SizedBox(
                              width: calculateSize(15),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                appText(
                                  "Guaranty Trust Bank",
                                  13,
                                  weight: FontWeight.w600,
                                  color: Color(0xff1D1A40),
                                ),
                                appText(
                                  "$fname",
                                  13,
                                  weight: FontWeight.w500,
                                  color: Color(0xff76768D),
                                ),
                                appText(
                                  "${accountController.text}******",
                                  13,
                                  weight: FontWeight.w500,
                                  color: Color(0xff76768D),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          AppDropDown(
                            hint: "Select Bank",
                            dropdownMenuItems: _dropdownMenuItemsbank,
                            selectedItemBundle: _selectedItembank,
                            onChangeFx: (value) {
                              setState(() {
                                _selectedItembank = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: calculateSize(30),
                          ),
                          AppTextFieldWidget(
                            textInputType: TextInputType.number,
                            controller: accountController,
                            labelText: "Enter account number",
                            //prefixText: "N ",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: calculateSize(30),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isVisible) {
                          if (_selectedItembank == null ||
                              accountController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Kindly select bank and input account number"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            return;
                          }

                          setState(() {
                            isVisible = false;
                          });
                        } else {
                          Navigator.of(context).pushNamed(Step7SignUp.routeName,
                              arguments: fname);
                        }
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
