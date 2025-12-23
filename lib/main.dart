import 'package:flutter/material.dart';
import 'package:imcflutter/config/hive_config.dart';
import 'package:imcflutter/myapp.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await HiveConfig.start();

  runApp(const MyApp());
}
