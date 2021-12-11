class Numero {
  int i;

  Numero(this.i);

  Numero operator +(Numero numero2) {
    return Numero((i + numero2.i) * 2);
  }

  String operator |(Numero numero) {
    return '$i | ${numero.i}';
  }

  Numero operator -(Numero numero2) {
    return Numero(i - numero2.i);
  }
}