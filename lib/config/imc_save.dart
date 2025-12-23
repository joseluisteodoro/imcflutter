import 'package:hive/hive.dart';

part 'imc_save.g.dart';

@HiveType(typeId: 0)
class ImcSave extends HiveObject {
  @HiveField(0)
  double peso;

  @HiveField(1)
  double altura;

  @HiveField(2)
  double imc;

  @HiveField(3)
  String classificacao;

  @HiveField(4)
  DateTime data;

  ImcSave({
    required this.peso,
    required this.altura,
    required this.imc,
    required this.classificacao,
    required this.data

  });
}

// flutter pub run build_runner build