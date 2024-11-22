import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:safasughar/features/auth/views/screens/auth_screen.dart';
import 'package:safasughar/features/shared/views/screens/home_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.blue,
            ],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Lottie.asset(
                'assets/lotties/loading.json',
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Center(
                  child: Text(
                    'Safa Sughar'.toUpperCase(),
                    style: TextStyle(
                      fontFamily: GoogleFonts.gamjaFlower().fontFamily,
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onInit() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(milliseconds: 3000));
    if (!mounted) return;

    if (firebaseUser == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }
}
