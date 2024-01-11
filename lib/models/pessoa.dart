class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  getNome() {
    return _nome;
  }

  getPeso() {
    return _peso;
  }

  getAltura() {
    return _altura;
  }
}
