import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/auth/providers/auth_provider.dart';
import 'package:safasughar/features/auth/views/screens/auth_screen.dart';
import 'package:safasughar/features/guideline_v2/views/widgets/guidelines_list.dart';
import 'package:safasughar/features/shared/views/widgets/round_icon_button.dart';

class GuidelinesScreenV2 extends ConsumerStatefulWidget {
  const GuidelinesScreenV2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GuidelinesScreenV2State();
}

class _GuidelinesScreenV2State extends ConsumerState<GuidelinesScreenV2> {
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
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _headerBuilder(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const GuidelinesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hello, ${FirebaseAuth.instance.currentUser?.displayName ?? 'Friend'}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
            RoundIconButton(
              bgColor: Colors.white.withOpacity(0.2),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                ref.read(providerOfAuth.notifier).signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const AuthScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'Today\n${getMonth(DateTime.now().month)} ${DateTime.now().day}',
          style: const TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            height: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String getMonth(final int monthNum) {
    switch (monthNum) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
