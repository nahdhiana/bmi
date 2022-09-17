import 'package:flutter/material.dart';

import '../screens/main_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme: ThemeData.dark(),
      home: const MainScreen(),
    ),
  );
}
