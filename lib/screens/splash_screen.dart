import 'package:flutter/material.dart';
import 'tabs_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Stack(
          children: [
            SplashScreenView(
                navigateRoute: const TabsScreen(),
                text: 'Please wait..',
                textStyle: Theme.of(context).textTheme.headline4,
                textType: TextType.ScaleAnimatedText),
            const Align(
              alignment: Alignment(0, 0.85),
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    ));
  }
}
