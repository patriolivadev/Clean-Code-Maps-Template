import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Hola!')),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Candida de clicks',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$clickCounter',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape: const StadiumBorder(),
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () {
              if(clickCounter == 0) return;
              clickCounter--;
              setState(() {});
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
