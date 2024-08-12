import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 6),
            (){
          Navigator.of(context).pushReplacementNamed('/intro');
        }
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.green.shade700,
              Colors.green.shade400,
              Colors.green.shade300,
            ],
          ),
        ),
        child: Center(
            child: Text.rich(
              textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                  text: 'My Habit',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: '\nTracker',
                  style: TextStyle(
                    letterSpacing: 1,
                      color: Colors.black,
                      fontSize: 30,)),
            ],
          ),
        )),
      ),
    );
  }
}
