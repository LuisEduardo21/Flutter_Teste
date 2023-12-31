import 'package:flutter/material.dart';
import 'package:projectest/components/difficulty.dart';
import 'package:projectest/data/task_dao.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  Task(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.blue),
              height: 140,
            ),
            Column(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black26,
                          ),
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              widget.foto,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              )),
                          Difficulty(dificultyLevl: widget.dificuldade)
                        ],
                      ),
                      Container(
                        height: 92,
                        width: 65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      'Deseja realmente deletar?',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    content: const Text(
                                        "Depois de deletar a tarefa sumira!"),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancela'),
                                        child: const Text(
                                          'Cancelar',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          TaskDao().delete(widget.nome);
                                          Navigator.pop(context, 'Deleta');
                                        },
                                        child: const Text(
                                          'Sim',
                                          style: TextStyle(color: Colors.black54),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onPressed: () {
                              setState(() {
                                widget.nivel++;
                              });
                            },
                            child: const Column(
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.black38,
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 15
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Nivel : ${widget.nivel}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ],
              )
            ]),
          ],
        ));
  }
}
