import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

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
          body: AnimatedOpacity(
            opacity: opacidade ? 1 : 0,
            duration: Duration(milliseconds: 800),
            child: ListView(scrollDirection: Axis.vertical, children: [
              Task(
                  'Aprender Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  3),
              Task(
                  'Andar de Bike',
                  'https://cdn.atletis.com.br/atletis-website/base/fc1/14f/84d/beneficios-andar-bicicleta.jpg',
                  2),
              Task(
                  'Passear',
                  'https://patrocinados.estadao.com.br/portal-animal/wp-content/uploads/sites/8/2018/11/homedogwalk-630x419.jpg',
                  4),
              Task(
                  'Estudar',
                  'https://s1.static.brasilescola.uol.com.br/be/conteudo/images/o-estudo-diario-segredo-bom-desempenho-escolar-1317739140.jpg',
                  5),
              Task(
                  'Jogar',
                  'https://uploads-anchieta-br.s3.sa-east-1.amazonaws.com/wp-content/uploads/sites/7/2019/03/18144919/foto-como-jogar-video-game-1.jpg',
                  1),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
             setState(() {
                opacidade = !opacidade;
             });
            },
            child: Icon(Icons.remove_red_eye),
          ),
        ));
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

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
                            Container(
                                width: 200,
                                child: Text(
                                  widget.nome,
                                  style: TextStyle(
                                      fontSize: 24,
                                      overflow: TextOverflow.ellipsis),
                                )),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 1)
                                      ? Colors.blue
                                      : Colors.blue[100],
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 2)
                                      ? Colors.blue
                                      : Colors.blue[100],
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 3)
                                      ? Colors.blue
                                      : Colors.blue[100],
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 4)
                                      ? Colors.blue
                                      : Colors.blue[100],
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 5)
                                      ? Colors.blue
                                      : Colors.blue[100],
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 92,
                          width: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
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
                          backgroundColor: Colors.black38,
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 15
                              : 1,
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
