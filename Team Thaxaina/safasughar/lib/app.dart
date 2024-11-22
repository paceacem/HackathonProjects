import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/splash_screen.dart';

class SafaSugharApp extends ConsumerStatefulWidget {
  const SafaSugharApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SafaSugharAppState();
}

class _SafaSugharAppState extends ConsumerState<SafaSugharApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safa Sughar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      home: const SplashScreen(),
    );
  }
}
