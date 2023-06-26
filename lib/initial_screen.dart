import 'package:flutter/material.dart';
import 'package:projectest/Task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}