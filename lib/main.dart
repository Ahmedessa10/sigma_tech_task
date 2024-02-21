import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sigma_tech_task/app/presentation/pages/home_page.dart';

import 'core/service_locator/sl.dart';
Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().initApp();

  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization logic here, like loading data or checking authentication.
    // After a delay, navigate to the next screen.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()), // Replace HomeScreen with your actual home screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie.json'), // Replace with your Lottie animation file
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the App!'),
      ),
    );
  }
}


