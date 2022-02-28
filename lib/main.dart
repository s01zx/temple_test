import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temple_test/helpers/routes.dart';
import 'package:temple_test/providers/app_provider.dart';
import 'package:temple_test/screens/splash.dart';

import 'helpers/custom_routes.dart';
import 'helpers/sizeConfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            title: 'Amaze-ing',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: "SFPRO",
              pageTransitionsTheme: PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CustomPageTransitionBuilder(),
                  TargetPlatform.iOS: CustomPageTransitionBuilder(),
                },
              ),
            ),
            home: const SplashScreen(),
            routes: routes,
          );
        });
      }),
    );
  }
}
