import "package:flutter/material.dart";
import 'package:open_box/app.dart';
import 'package:open_box/data/core/di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}
