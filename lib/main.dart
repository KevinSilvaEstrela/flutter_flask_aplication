import 'package:flutter/material.dart';
import 'package:flutter_autenticacao/tela_inicial.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/tela_inicial': (context) => TelaInicial(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _authenticate() async {
    final response = await http.post(
      Uri.http('127.0.0.1:5000', '/api/authenticate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed('/tela_inicial');
      //print('Autenticado com sucesso!');
      //Navigator.of(context).pushNamed('/tela_inicial');
    } else {
      print('Falha na autenticação.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticação Flutter + Flask - Usuario = User | Password = 123'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
