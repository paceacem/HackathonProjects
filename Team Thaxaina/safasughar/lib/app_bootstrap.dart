import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/app.dart';

class AppBootstrap {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    return runApp(
      const ProviderScope(
        child: SafaSugharApp(),
      ),
    );
  }
}
