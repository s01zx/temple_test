import 'package:flutter/material.dart';
import 'package:temple_test/helpers/const_values.dart';

class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);
  static const routeName = '/done';

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? rotateAnimation;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    rotateAnimation = Tween<double>(begin: 0, end: 5).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.elasticOut));
    scaleAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeIn));
    _controller!.repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: pageMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: scaleAnimation!,
              child: RotationTransition(
                turns: rotateAnimation!,
                child: Image.asset("assets/images/40.png"),
              ),
            ),
            appText(
              "Amaze-ing!!!",
              17,
              weight: FontWeight.w700,
              topmargin: 24.0,
              bottommargin: 5.0,
              color: Color(0xff1D1A42),
            ),
            appText(
              "Your application is undergoing review. You will receive a notification once the review is complete.",
              13,
              bottommargin: 11.0,
              color: Color(0xff140432),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              child: Container(
                alignment: Alignment.center,
                height: calculateSize(57),
                width: calculateSize(160),
                decoration: BoxDecoration(
                  color: Color(0xffE6007E),
                  borderRadius: BorderRadius.circular(
                    calculateSize(50),
                  ),
                ),
                child: appText("Continue", 15,
                    weight: FontWeight.w600, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
