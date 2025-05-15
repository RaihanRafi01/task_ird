import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'core/constants/constants.dart';
import 'core/di/dependency_injection.dart';
import 'presentation/screens/books_screen.dart';

// Entry point of the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyDatabaseFromAssets(); // Copy database from assets
  setupDependencies(); // Initialize dependency injection
  runApp(const MyApp());
}

// Copies the database from assets to the app's documents directory.
Future<void> copyDatabaseFromAssets() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, AppConstants.databasePath));
  if (!await file.exists()) {
    final data = await rootBundle.load('assets/${AppConstants.databasePath}');
    final bytes = data.buffer.asUint8List();
    await file.writeAsBytes(bytes);
  }
}

// Main app widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hadith App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BooksScreen(),
    );
  }
}