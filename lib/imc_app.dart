import 'dart:convert';
import 'dart:io';

import 'package:imc_app/exception/nome_invalido_exception.dart';
import 'package:imc_app/models/pessoa.dart';

void calculate() {
  print("Bem vindo à calculadora IMC!");

  print("Informe seu nome:");
  var line = stdin.readLineSync(encoding: utf8);
  var nome = line ?? "";

  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    nome = "Nome Padção";
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  print("Informe seu peso:");
  line = stdin.readLineSync(encoding: utf8);
  var peso = double.parse(line ?? "0");

  print("Informe seu altura:");
  line = stdin.readLineSync(encoding: utf8);
  var altura = double.parse(line ?? "0");

  Pessoa pessoa = Pessoa(nome, peso, altura);

  var imc = pessoa.getPeso() / (pessoa.getAltura() * 2);

  print("${pessoa.getNome()}, seu IMC é de : $imc");

  if (imc < 16) {
    print("Você está classificado como: Magreza grave!");
  } else if (imc < 17) {
    print("Você está classificado como: Magreza moderada!");
  } else if (imc < 18.5) {
    print("Você está classificado como: Magreza leve!");
  } else if (imc < 25) {
    print("Você está classificado como: Saudável!");
  } else if (imc < 30) {
    print("Você está classificado como: Sobrepeso!");
  } else if (imc < 35) {
    print("Você está classificado como: Obesidade Grau I!");
  } else if (imc < 40) {
    print("Você está classificado como: Obesidade Grau II (severa)!");
  } else if (imc >= 40) {
    print("Você está classificado como: Obesidade Grau III (mórbida)!");
  }
}
