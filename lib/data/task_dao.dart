import 'package:projectest/components/Task.dart';
import 'package:projectest/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_difficulty INTEGER,'
      '$_image TEXT)';

  static const String _tablename = 'tasktable';
  static const String _difficulty = 'dificuldade';
  static const String _name = 'nome';
  static const String _image = 'imagem';

  save(Task tarefa) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('A tarefa não existia');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa já existia');
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ? ', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    print('Mapa de tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print("Acessando o findAll: ");
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print("Procurando dados no banco de dados...encontrado: $result");
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print("Convertendo to list: ");
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print("Acessando o find: ");
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando Tarefa: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}
