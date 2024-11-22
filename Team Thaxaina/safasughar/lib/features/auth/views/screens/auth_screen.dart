import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/auth/providers/auth_provider.dart';
import 'package:safasughar/features/shared/views/screens/home_screen.dart';
import 'package:safasughar/features/shared/views/widgets/button.dart';
import 'package:safasughar/features/shared/views/widgets/spinner.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GetStartedScreenState();
}

class _GetStartedScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(providerOfAuth.select((value) => null));

    _listenToSignInWithGoogleState();

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
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: _imagesBuilder(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleBuilder(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _descriptionBuilder(),
                          const SizedBox(
                            height: 50.0,
                          ),
                          _buttonBuilder(),
                          const SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleBuilder() {
    return Text(
      "Let's Get\nStarted",
      style: TextStyle(
        color: Colors.white,
        fontSize: 60.0,
        fontWeight: FontWeight.bold,
        height: 1.2,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }

  Widget _descriptionBuilder() {
    return const Text(
      "Transforming trash into treasure - smarter waste management for a cleaner tomorrow.",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }

  Widget _buttonBuilder() {
    return Row(
      children: [
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final isLoading = ref.watch(
                providerOfAuth.select(
                  (value) => value.signInWithGoogleState.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                ),
              );
              return AppButton.filled(
                color: Colors.white,
                isLoading: isLoading,
                icon: Image.asset(
                  'assets/logos/google_logo.png',
                  width: 30.0,
                  height: 30.0,
                ),
                valueStyle: const TextStyle(
                  color: Colors.blue,
                ),
                borderRadius: 10.0,
                padding: const EdgeInsets.all(14.0),
                loader: const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: AppSpinner(
                    size: 15,
                    color: Colors.blue,
                  ),
                ),
                onPressed: isLoading ? () {} : _signInWithGoogle,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _imagesBuilder() {
    return Stack(
      children: [
        Positioned(
          left: 50.0,
          top: 40.0,
          child: _imageBuilder(
            path: 'assets/images/waste_management1.jpg',
            size: 100.0,
            angle: pi * -0.1,
          ),
        ),
        Positioned(
          left: 240.0,
          top: 5.0,
          child: _imageBuilder(
            path: 'assets/images/waste_management2.jpg',
            size: 80.0,
            angle: pi / 20,
          ),
        ),
        Positioned(
          left: -5.0,
          top: 200.0,
          child: _imageBuilder(
            path: 'assets/images/waste_management3.jpg',
            size: 140.0,
            angle: pi / 12,
          ),
        ),
        Positioned(
          right: -10.0,
          top: 140.0,
          child: _imageBuilder(
            path: 'assets/images/waste_management4.png',
            size: 240.0,
            angle: -pi / 10,
          ),
        ),
      ],
    );
  }

  Widget _imageBuilder({
    required final String path,
    required final double size,
    required final double angle,
  }) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              path,
            ),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0.0, 0.0),
              blurRadius: 10.0,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  void _listenToSignInWithGoogleState() {
    ref.listen(
      providerOfAuth.select(
        (value) => value.signInWithGoogleState,
      ),
      (prev, next) {
        if (prev != next) {
          next.maybeWhen(
            success: (_) => _gotoHomeScreen(),
            orElse: () {},
          );
        }
      },
    );
  }

  void _signInWithGoogle() {
    ref.read(providerOfAuth.notifier).signInWithGoogle();
  }

  void _gotoHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
