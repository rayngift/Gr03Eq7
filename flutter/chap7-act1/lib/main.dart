import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Compteur(),
      child: MyApp(),
    ),
  );
}

class Compteur extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Compteur Provider')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MonWidgetPrincipal(),
              SizedBox(height: 20),
              SecondWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MonWidgetPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final compteur = Provider.of<Compteur>(context);
    return Column(
      children: [
        Text('Compteur principal: ${compteur.count}',
            style: TextStyle(fontSize: 22)),
        ElevatedButton(
          onPressed: compteur.increment,
          child: Text('Incrémenter'),
        ),
      ],
    );
  }
}

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final compteur = Provider.of<Compteur>(context);
    return Column(
      children: [
        Text('Compteur secondaire: ${compteur.count}',
            style: TextStyle(fontSize: 20)),
        ElevatedButton(
          onPressed: compteur.decrement,
          child: Text('Décrémenter'),
        ),
      ],
    );
  }
}