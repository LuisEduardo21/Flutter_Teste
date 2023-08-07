import 'package:flutter/material.dart';
import 'package:projectest/components/Task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
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
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType();
    assert(result != null, 'No taskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
