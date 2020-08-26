import 'package:curso_bipp/models/curso.dart';
import 'package:curso_bipp/providers/cursos.dart';
import 'package:curso_bipp/widgets/curso_item.dart';
import 'package:curso_bipp/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CursoScreen extends StatefulWidget {
  @override
  _CursoScreenState createState() => _CursoScreenState();
}

class _CursoScreenState extends State<CursoScreen> {
  var _isInit = true;
  List<Curso> cursos = [];

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Cursos>(context).getDataCursos();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    cursos = Provider.of<Cursos>(context, listen: false).getCursos;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: cursos.length,
            itemBuilder: (_, idx) => Column(
              children: [
                CursoItem(curso: cursos[idx]),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
