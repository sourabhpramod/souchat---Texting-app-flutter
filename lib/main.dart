import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:souchat/services/auth/auth_gate.dart';
import 'package:souchat/firebase_options.dart';
//import 'package:souchat/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: Lightmode,
      home: AuthGate(),
    );
  }
}
