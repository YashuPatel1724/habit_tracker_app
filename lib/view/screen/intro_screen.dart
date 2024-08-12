import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Image.asset(fit: BoxFit.cover,'assets/images/Screenshot_2024-08-12_100534-removebg-preview.png'),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  alignment: Alignment.center,
                  child: Text('Get Started',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
