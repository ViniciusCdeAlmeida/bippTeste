import 'dart:convert';

import 'package:curso_bipp/models/curso.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cursos with ChangeNotifier {
  List<Curso> _cursos = [];

  List<Curso> get getCursos {
    return [..._cursos];
  }

  Curso cursoPorId(String id) {
    return _cursos.firstWhere((curso) => curso.id == id);
  }

  void adicionarCurso(Curso product) {
    _cursos.add(product);
    notifyListeners();
  }

  Future<void> getDataCursos() async {
    try {
      final dados = await rootBundle.loadString("assets/cursos.json");
      final extData = json.decode((dados));
      _cursos.addAll(fromJson(extData["curso"]));
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void atualizarCurso(String id, Curso novoCurso) {
    final crusoIdx = _cursos.indexWhere((prod) => prod.id == id);
    if (crusoIdx >= 0) {
      _cursos[crusoIdx] = novoCurso;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void removerCurso(String id) {
    _cursos.removeWhere((curso) => curso.id == id);
    notifyListeners();
  }
}
