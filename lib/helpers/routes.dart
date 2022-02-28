import 'package:temple_test/screens/done.dart';
import 'package:temple_test/screens/sign_up.dart';
import 'package:temple_test/screens/step2_signup.dart';
import 'package:temple_test/screens/step3_signup.dart';
import 'package:temple_test/screens/step4_signUp.dart';
import 'package:temple_test/screens/step5_signUp.dart';
import 'package:temple_test/screens/step6_signUp.dart';
import 'package:temple_test/screens/step7_signUP.dart';
import 'package:temple_test/screens/step8_signup.dart';

final routes = {
  SignUpScreen.routeName: (ctx) => SignUpScreen(),
  Step2.routeName: (ctx) => Step2(),
  Step3SignUp.routename: (ctx) => Step3SignUp(),
  step4SignUp.routeName: (ctx) => step4SignUp(),
  Step5SignUp.routeName: (ctx) => Step5SignUp(),
  Step6SignUp.routeName: (ctx) => Step6SignUp(),
  Step7SignUp.routeName: (ctx) => Step7SignUp(),
  SignUp8.routeName: (ctx) => SignUp8(),
  Done.routeName: (ctx) => Done(),
};
