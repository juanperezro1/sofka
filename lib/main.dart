import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba/src/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Fail Conexion');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ProviderScope(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primarySwatch: Colors.yellow),
              home: const WelcomeScreen(),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
