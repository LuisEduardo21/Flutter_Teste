import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Nova Tarefa",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
            body: Center(
                child: SingleChildScrollView(
              child: Container(
                height: 810,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nome",
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              int.parse(value) > 5 ||
                              int.parse(value) < 1) {
                            return 'Insira um valor entre 1 e 5!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Dificuldade",
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira uma URL de imagem";
                          }
                          return null;
                        },
                        controller: imageController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Imagem",
                            fillColor: Colors.white70,
                            filled: true),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 92,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset('assets/images/nophoto.png');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(nameController.text);
                          print(difficultyController.text);
                          print(imageController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Salvando as tarefas!")),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Adicionar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }
}
