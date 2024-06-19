import 'package:flutter/material.dart';
import 'package:darturbation/darturbation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Darturbation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Darturbation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedButton(
              text: 'Press Me',
              onPressed: () {
                Navigator.of(context).push(CustomPageTransition(page: const SecondScreen()));
              },
            ),
            const SizedBox(height: 20),
            const LoadingIndicator(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(CustomPageTransition(page: const SecondScreen(), transitionType: PageTransitionType.fade));
              },
              child: const Text('Fade Transition'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(CustomPageTransition(page: const SecondScreen(), transitionType: PageTransitionType.scale));
              },
              child: const Text('Scale Transition'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(CustomPageTransition(page: const SecondScreen(), transitionType: PageTransitionType.rotation));
              },
              child: const Text('Rotation Transition'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: const Center(
        child: Text('This is the second screen!'),
      ),
    );
  }
}