import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            // leading: Container(color: Colors.black26),
            title: Text(
              'Tarefas',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: ListView(scrollDirection: Axis.vertical, children: [
            Task('Aprender Flutter'),
            Task('Andar de Bike'),
            Task('Passear'),
            Task('Estudar')
          ]),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        ));
  }
}

class Task extends StatefulWidget {
  final String nome;
  const Task(this.nome, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Colors.blue,
                height: 140,
              ),
              Column(children: [
                Container(
                    color: Colors.white,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                        ),
                        Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        Container(
                          height: 68,
                          width: 68,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue),
                              onPressed: () {
                                setState(() {
                                  nivel++;
                                });
                              },
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'UP',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    )
                                  ])),
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.black12,
                          value: nivel / 15,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Nivel : $nivel',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))
                  ],
                )
              ]),
            ],
          ),
        ));
  }
}
