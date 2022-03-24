import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_tarefas/controllers/TarefaController.dart';
import 'package:lista_tarefas/pages/notas_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Tarefas a fazer'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final TarefaController tarefasController = TarefaController();
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) => tarefasController.tarefas.isEmpty
              ? TarefasVazias()
              : Tarefas(
                  tarefasController: tarefasController,
                ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NotasPage(
                      tarefasController: tarefasController,
                    )),
          );
        },
        tooltip: 'Criar',
        child: const Icon(Icons.add_box_rounded),
        backgroundColor: Colors.purple[700],
      ),
    );
  }
}

class Tarefas extends StatelessWidget {
  const Tarefas({
    Key? key,
    required this.tarefasController,
  }) : super(key: key);

  final TarefaController tarefasController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: List.generate(
          tarefasController.tarefas.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotasPage(
                          tarefas: tarefasController.tarefas[index],
                          keyTarefa: index,
                          tarefasController: tarefasController,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tarefasController.tarefas[index]['title']!,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    tarefasController.tarefas[index]['tarefa']!,
                    maxLines: 7,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TarefasVazias extends StatelessWidget {
  const TarefasVazias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Nenhuma tarefa pra hoje",
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple[700]),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Image.asset("assets/img/checked.png"))
        ],
      ),
    );
  }
}
