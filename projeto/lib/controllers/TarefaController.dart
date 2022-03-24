import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'TarefaController.g.dart';

class TarefaController = TarefaControllerBase with _$TarefaController;

abstract class TarefaControllerBase with Store {

  @observable
  ObservableList<Map<String, String>> tarefas = ObservableList.of([]);

  @action
  void addTarefa(String title, String tarefa) {
    tarefas.add(Map.from({"title": title, "tarefa": tarefa}));
  }

  @action
  void editTarefa(int index, String title, String tarefa) {
    tarefas[index] = Map.from({"title": title, "tarefa": tarefa});
  }

  @action
  void removeTarefa(int index) {
    tarefas.removeAt(index);
  }
}
