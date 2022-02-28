import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:temple_test/helpers/sizeConfig.dart';

final pageMargin = EdgeInsets.only(
  left: calculateSize(28),
  right: calculateSize(28),
  top: calculateSize(20),
  //bottom: calculateSize(20),
);

const BASE_URL = 'http://amaze-staging.us-east-2.elasticbeanstalk.com/api';

final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffE6007E), Color(0xffB800E6)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

double calculateSize(double size) {
  var val = size / 8.53;
  return val * SizeConfig.heightMultiplier!;
}

// custom text
Widget appText(String tx, double size,
    {FontWeight weight = FontWeight.w400,
    topmargin = 0.0,
    bottommargin = 0.0,
    leftmargin = 0.0,
    rightmargin = 0.0,
    TextAlign align = TextAlign.center,
    Color color = Colors.green,
    double? space,
    bool softwrap = true,
    TextOverflow? overflow,
    FontStyle fontStyle = FontStyle.normal}) {
  return Container(
    margin: EdgeInsets.only(
        top: calculateSize(topmargin),
        bottom: calculateSize(bottommargin),
        left: calculateSize(leftmargin),
        right: calculateSize(rightmargin)),
    child: Text(
      tx == null ? "" : tx,
      softWrap: softwrap,
      overflow: overflow,
      textAlign: align,
      style: TextStyle(
        fontSize: calculateSize(size),
        fontWeight: weight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: space,
      ),
    ),
  );
}

//custom textfield
class AppTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final obscureTextcharacter;
  final textInputType;
  final labelText;
  final Function(String?)? fxsavedValue;
  final String? Function(String?)? fx;
  final String? initval;
  final String? sufixT;
  final enabled;
  final trailingButton;
  final prefixText;
  final controller;
  final focusNode;
  final maxLines;
  final prefixIcon;

  AppTextFieldWidget({
    this.labelText = "",
    this.enabled = true,
    this.obscureText = false,
    this.initval,
    this.textInputType = TextInputType.text,
    this.fxsavedValue,
    this.fx,
    this.sufixT,
    this.maxLines = 1,
    this.obscureTextcharacter = "*",
    this.trailingButton,
    this.prefixText,
    this.controller,
    this.focusNode,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //appText(labelText, 16, topmargin: 20.0),
        Container(
          color: Color(0xffFFFFFF),
          //margin: EdgeInsets.symmetric(horizontal: calculatefontSize(5)),
          child: TextFormField(
              enabled: enabled,
              initialValue: initval,
              controller: controller,
              focusNode: focusNode,
              obscureText: obscureText,
              obscuringCharacter: "*",
              maxLines: maxLines,
              keyboardType: textInputType,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: calculateSize(17),
                  color: Colors.grey),
              decoration: InputDecoration(
                suffixIcon: trailingButton,
                suffixText: sufixT,
                prefixText: prefixText,
                prefixIcon: prefixIcon,
                errorMaxLines: 3,
                isDense: true,
                labelText: labelText,
                labelStyle: TextStyle(color: Color(0xff979797)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                //labelText: labelText,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffCBC8D2)),
                    borderRadius: BorderRadius.circular(5)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffCBC8D2)),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffCBC8D2)),
                    borderRadius: BorderRadius.circular(5)),
              ),
              onSaved: fxsavedValue,
              validator: fx),
        )
      ],
    );
  }
}

List<DropdownMenuItem<Map<String, dynamic>>> buildDropDownMenuItems(
    List listItems) {
  List<DropdownMenuItem<Map<String, dynamic>>> items = [];
  for (Map<String, dynamic> listItem in listItems) {
    items.add(
      DropdownMenuItem(
        child: Text(listItem["name"]),
        value: listItem,
      ),
    );
  }
  return items;
}

class AppDropDown extends StatelessWidget {
  final hint;
  final innerHint;
  final dropdownMenuItems;
  final onChangeFx;
  final selectedItemBundle;

  AppDropDown({
    this.hint,
    this.innerHint,
    this.dropdownMenuItems,
    this.onChangeFx,
    this.selectedItemBundle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(hint, 16, topmargin: 20.0),
        Container(
          //margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          padding: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: Color(0xffF6F6FF).withOpacity(0.5),
              border: Border.all(color: Color(0xffC4C4C4)),
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Map<String, dynamic>>(
              dropdownColor: Colors.white,
              isExpanded: true,
              style: TextStyle(color: Colors.grey),
              hint: innerHint,
              items: dropdownMenuItems,
              onChanged: onChangeFx,
              value: selectedItemBundle,
            ),
          ),
        ),
      ],
    );
  }
}

void showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Lottie.asset('assets/images/loading.json',
            repeat: true,
            reverse: false,
            animate: true,
            width: calculateSize(100),
            height: calculateSize(100)),
      ),
    ),
  );
}
