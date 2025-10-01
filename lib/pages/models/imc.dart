class IMC {
  double ?_peso;
  double ?_alturacm;
  double _imcfinal = 0;

  IMC (this._peso,this._alturacm);

  get getpeso => _peso;
  get getalturacm => _alturacm;
  get getimc => _imcfinal;
  set setpeso (double peso) => _peso = peso;
  set setalturacm (double alturacm) => _alturacm = alturacm;

  double calcular () {
    double alturam = _alturacm! / 100;
    double imccalculado = _peso! / (alturam*alturam);
    return _imcfinal = double.parse(imccalculado.toStringAsFixed(1));
  }

  String resultadoimc () {
    switch (_imcfinal) {
      case <16: 
      return "Magreza Grave";

      case >=16 && <17:
      return "Magreza Moderada";

      case >=17 && <18.5:
      return "Magreza Leve";

      case >=18.5 && <25:
      return "Saudável";

      case >=25 && <30:
      return "Sobrepeso";

      case >=30 && <35:
      return "Obesidade Grau I";

      case >=35 && <40:
      return "Obesidade Grau II (Severa)";
    }
    return "Obesidade Grau III (Mórbida)";
  }

}