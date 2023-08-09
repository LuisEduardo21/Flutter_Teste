import 'package:flutter/material.dart';
import 'package:projectest/components/Task.dart';
import 'package:projectest/data/task_dao.dart';
import 'package:projectest/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
            color: Colors.white,
          )
        ],
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text("Carregando")
                    ]),
                  );

                case ConnectionState.waiting:
                  return const Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text("Carregando")
                    ]),
                  );

                case ConnectionState.active:
                  return const Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                      Text("Carregando")
                    ]),
                  );

                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return const Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.error_outline, size: 128),
                            Text(
                              'Não há nenhuma Tarefa',
                              style: TextStyle(fontSize: 32),
                            )
                          ]),
                    );
                  }
                  return Text('Erro ao carregar Tarefas');
              }
              return Text('Erro Desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
                print('Recarregando a tela inicia');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
