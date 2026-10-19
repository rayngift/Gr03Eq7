import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculatrice simple',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(useMaterial3: true),
      home: const Calculatrice(),
    );
  }
}

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key});

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  final TextEditingController _ctrl1 = TextEditingController();
  final TextEditingController _ctrl2 = TextEditingController();
  String _resultat = '';

  @override
  void dispose() {
    _ctrl1.dispose();
    _ctrl2.dispose();
    super.dispose();
  }

  void _calculer(String operation) {
    final double? a = double.tryParse(_ctrl1.text.replaceAll(',', '.'));
    final double? b = double.tryParse(_ctrl2.text.replaceAll(',', '.'));

    if (a == null || b == null) {
      setState(() {
        _resultat = 'Veuillez saisir deux nombres valides';
      });
      return;
    }

    double res;
    switch (operation) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '×':
        res = a * b;
        break;
      case '÷':
        if (b == 0) {
          setState(() {
            _resultat = 'Division par zéro impossible';
          });
          return;
        }
        res = a / b;
        break;
      default:
        return;
    }

    setState(() {
      // Affiche un entier sans ".0"
      _resultat = 'Résultat : ${res == res.roundToDouble() ? res.toInt() : res}';
    });
  }

  void _reset() {
    setState(() {
      _ctrl1.clear();
      _ctrl2.clear();
      _resultat = '';
    });
  }

  Widget _boutonOperation(String symbole) {
    return ElevatedButton(
      onPressed: () => _calculer(symbole),
      child: Text(symbole),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculatrice simple',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _ctrl1,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: const InputDecoration(
                  labelText: 'Nombre 1',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _ctrl2,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: const InputDecoration(
                  labelText: 'Nombre 2',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _boutonOperation('+'),
                  _boutonOperation('-'),
                  _boutonOperation('×'),
                  _boutonOperation('÷'),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.deepPurple,
                ),
                child: const Text('Reset'),
              ),
              const SizedBox(height: 24),
              Text(
                _resultat,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}