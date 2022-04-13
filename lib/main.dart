import 'package:flutter/material.dart';

import 'modules/product_type/product_register_page.dart';
import 'modules/product_type/product_type_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LogSolver',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.dark(),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.blue,
          selectionHandleColor: Colors.blue,
          cursorColor: Colors.blue,
        ),
      ),
      home: const MyHomePage(title: 'LogSolver'),
      routes: {
        "/product_type": ((context) => ProductType()),
        "/product_register": ((context) => ProductRegister()),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestão de armazém"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          "Gestão de armazém",
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/product_type");
        },
        icon: const Icon(Icons.search),
        label: const Text("Tipo de produto"),
      ),
    );
  }
}
