import '../util/constants.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Replace with your actual import

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2500), () {
      NavigateToHome(context);
    });
  }

  void NavigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDF7EA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/calculator1.png'),
              width: 320,
              height: 320,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EMI',
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      color: mainColor),
                ),
                SizedBox(width: 13,),
                Text(
                  'Calculator',
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your Finance Planning Buddy!',style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
