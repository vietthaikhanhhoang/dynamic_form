import 'package:flutter/material.dart';
import 'second_page.dart';
import 'print_page.dart';
import 'dynamic_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _goToSecondPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SecondPage(),
      ),
    );
  }

  void _goToPrintPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PrintPage(),
      ),
    );
  }

  void _goToDynamicFormPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const dynamic_form(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _goToSecondPage,
              child: const Text("Go to Hello World"),
            ),
            const SizedBox(height: 16), // khoảng cách giữa 2 nút
            ElevatedButton(
              onPressed: _goToPrintPage,
              child: const Text("Go to Print Page"),
            ),
            const SizedBox(height: 16), // khoảng cách giữa 2 nút
            ElevatedButton(
              onPressed: _goToDynamicFormPage,
              child: const Text("Go to DynamicForm Page"),
            ),
          ],
        ),
      ),
    );
  }

}
