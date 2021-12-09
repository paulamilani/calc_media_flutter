import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculador de Média',
      home: new FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorN1 = TextEditingController();
  final TextEditingController _controladorN2 = TextEditingController();
  final TextEditingController _controladorN3 = TextEditingController();

  String texto = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarefa Final DPM 2021.2'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('CALCULADOR DE MÉDIA'),
              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: Theme.of(context).textTheme.headline6,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorEmail,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: Theme.of(context).textTheme.headline6,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorN1,
                  decoration: InputDecoration(
                      labelText: 'Nota 1',
                      labelStyle: Theme.of(context).textTheme.headline6,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorN2,
                  decoration: InputDecoration(
                      labelText: 'Nota 2',
                      labelStyle: Theme.of(context).textTheme.headline6,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorN3,
                  decoration: InputDecoration(
                      labelText: 'Nota 3',
                      labelStyle: Theme.of(context).textTheme.headline6,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('CALCULAR MÉDIA', textScaleFactor: 1.5),
                  onPressed: () {
                    setState(
                      () {
                        texto = _calcular();
                      },
                    );
                  },
                ),
              ),
              //  ),
              Text(texto),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('APAGAR DADOS', textScaleFactor: 1.5),
                  onPressed: () {
                    _controladorNome.text = '';
                    _controladorEmail.text = '';
                    _controladorN1.text = '';
                    _controladorN2.text = '';
                    _controladorN3.text = '';
                    setState(() {
                      texto = '';
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _calcular() {
    final String nome = _controladorNome.text;
    final String email = _controladorEmail.text;
    final double? nota1 = double.tryParse(_controladorN1.text);
    final double? nota2 = double.tryParse(_controladorN2.text);
    final double? nota3 = double.tryParse(_controladorN3.text);

    double soma = nota3! + nota2! + nota1!;
    double resultado = soma / 3;
    String saida = 'Nome:' +
        ' ' +
        nome +
        ' ' +
        'E-mail:' +
        ' ' +
        email +
        ' ' +
        'Nota 1:' +
        ' ' +
        nota1.toString() +
        ' ' +
        'nota 2' +
        ' ' +
        nota2.toString() +
        ' ' +
        'Nota 3:' +
        ' ' +
        nota3.toString() +
        ' ' +
        'Media:' +
        ' ' +
        resultado.toString();
    return saida;
  }
}
