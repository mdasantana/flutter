// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:lista_tarefas/controllers/TarefaController.dart';

class NotasPage extends StatefulWidget {
  final TarefaController tarefasController;
  Map<String, String>? tarefas;
  int? keyTarefa;
  NotasPage({
    Key? key,
    this.tarefas,
    this.keyTarefa,
    required this.tarefasController,
  }) : super(key: key);

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isNewTarefa = true;
  bool isNotEdtable = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _tarefaController = TextEditingController();

  @override
  void initState() {
    if (widget.tarefas != null) {
      _titleController.text = widget.tarefas!['title']!;
      _tarefaController.text = widget.tarefas!['tarefa']!;
      isNewTarefa = false;
      isNotEdtable = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tarefas != null ? widget.tarefas!['title']! : 'Nova tarefa',
        ),
        actions: [
          if (!isNewTarefa)
            IconButton(
              onPressed: () {
                widget.tarefasController.removeTarefa(widget.keyTarefa!);
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete_forever),
            ),
          if (!isNewTarefa && isNotEdtable)
            IconButton(
              onPressed: () {
                setState(() {
                  isNotEdtable = !isNotEdtable;
                });
              },
              icon: Icon(Icons.edit),
            ),
          if (isNewTarefa || !isNotEdtable)
            IconButton(
              onPressed: () {
                if (!isNewTarefa) {
                  widget.tarefasController.editTarefa(
                    widget.keyTarefa!,
                    _titleController.text,
                    _tarefaController.text,
                  );
                  Navigator.pop(context);
                } else {
                  if (_formKey.currentState!.validate()) {
                    widget.tarefasController.addTarefa(
                      _titleController.text,
                      _tarefaController.text,
                    );
                    Navigator.pop(context);
                  }
                }
              },
              icon: Icon(Icons.save),
            ),
        ],
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width * .8,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          controller: _titleController,
                          maxLength: 50,
                          readOnly: isNotEdtable,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe uma tarefa';
                            }
                          },
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Tarefa',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.purple),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                          expands: true,
                          minLines: null,
                          maxLines: null,
                          controller: _tarefaController,
                          maxLength: 150,
                          readOnly: isNotEdtable,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe uma descrição';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Descrição',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
