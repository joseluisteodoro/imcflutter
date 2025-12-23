import 'package:hive_flutter/hive_flutter.dart';
import 'package:imcflutter/config/imc_save.dart';

class HiveConfig {
  static start () async {
     await Hive.initFlutter();

     Hive.registerAdapter(ImcSaveAdapter());

     await Hive.openBox<ImcSave>('imc');
  }
}