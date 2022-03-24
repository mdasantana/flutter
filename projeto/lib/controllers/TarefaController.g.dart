// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TarefaController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TarefaController on TarefaControllerBase, Store {
  final _$tarefasAtom = Atom(name: 'TarefaControllerBase.tarefas');

  @override
  ObservableList<Map<String, String>> get tarefas {
    _$tarefasAtom.reportRead();
    return super.tarefas;
  }

  @override
  set tarefas(ObservableList<Map<String, String>> value) {
    _$tarefasAtom.reportWrite(value, super.tarefas, () {
      super.tarefas = value;
    });
  }

  final _$TarefaControllerBaseActionController =
      ActionController(name: 'TarefaControllerBase');

  @override
  void addTarefa(String title, String tarefa) {
    final _$actionInfo = _$TarefaControllerBaseActionController.startAction(
        name: 'TarefaControllerBase.addTarefa');
    try {
      return super.addTarefa(title, tarefa);
    } finally {
      _$TarefaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTarefa(int index, String title, String tarefa) {
    final _$actionInfo = _$TarefaControllerBaseActionController.startAction(
        name: 'TarefaControllerBase.editTarefa');
    try {
      return super.editTarefa(index, title, tarefa);
    } finally {
      _$TarefaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTarefa(int index) {
    final _$actionInfo = _$TarefaControllerBaseActionController.startAction(
        name: 'TarefaControllerBase.removeTarefa');
    try {
      return super.removeTarefa(index);
    } finally {
      _$TarefaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas}
    ''';
  }
}
