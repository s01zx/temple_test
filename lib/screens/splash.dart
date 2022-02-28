import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temple_test/helpers/const_values.dart';
import 'package:temple_test/providers/app_provider.dart';
import 'package:temple_test/screens/sign_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((value) {
      Provider.of<AppProvider>(context, listen: false).getCelebCat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Spacer(),
            Container(
              margin: EdgeInsets.only(left: calculateSize(45)),
              child: Image.asset("assets/images/speakericon.png"),
            ),
            SizedBox(
              height: calculateSize(10),
            ),
            Container(
              margin: EdgeInsets.only(left: calculateSize(45)),
              child: RichText(
                text: TextSpan(
                    text: "Amaze",
                    style: TextStyle(
                      color: Color(0xffE6007E),
                      fontWeight: FontWeight.w600,
                      fontSize: calculateSize(26),
                    ),
                    children: [
                      TextSpan(
                        text: "-ing",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: calculateSize(26),
                        ),
                      ),
                    ]),
              ),
            ),
            appText(
                "Amaze   We help bridge the gap between celebrities and their fans.",
                15,
                weight: FontWeight.w400,
                leftmargin: 45.0,
                rightmargin: 45.0,
                bottommargin: 15.0,
                topmargin: 10.0,
                color: Colors.white,
                align: TextAlign.start),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  bottom: calculateSize(15),
                  left: calculateSize(45),
                  right: calculateSize(45)),
              width: double.infinity,
              height: calculateSize(48),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(calculateSize(10)),
              ),
              child: Text(
                "Login",
                style:
                    TextStyle(fontSize: calculateSize(20), color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(SignUpScreen.routeName),
              child: Container(
                margin: EdgeInsets.only(
                    bottom: calculateSize(39),
                    left: calculateSize(45),
                    right: calculateSize(45)),
                width: double.infinity,
                height: calculateSize(48),
                decoration: BoxDecoration(
                  //color: Colors.green,
                  borderRadius: BorderRadius.circular(calculateSize(10)),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffE6007E),
                      Color(0xffB800E6),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff140432),
                      borderRadius: BorderRadius.circular(
                        calculateSize(10),
                      ),
                    ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: calculateSize(20),
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/splash.png"),
          ),
        ),
      ),
    );
  }
}
