// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1e3a8a),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Image(
                  image: NetworkImage(
                    'https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/dca2ffcd-3b5f-4231-b488-32303a01afd9.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'MazadyDz',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              tr('slogan'),
              style: const TextStyle(
                color: Color(0xFFBFDBFE),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
