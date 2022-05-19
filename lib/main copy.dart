// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("app"),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colors.cyan, Colors.red],
                  ),
                ),
                child: Image.asset("assets/images/fons2.png"),
              ),
              Card(
                margin: const EdgeInsets.only(
                    left: 25, top: 150, right: 25, bottom: 100),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Usuari',
                            hintText: 'Enter un correu valid abc@gmail.com'),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contrasenya',
                            hintText: 'Entra contra'),
                      ),
                      ElevatedButton(
                        child: const Text('Logon'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: size.height * 0.5,
            child: Image.network(
                "https://apod.nasa.gov/apod/image/2202/albireoSpectrum1024.jpg"),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            width: double.infinity,
            height: size.height * 0.6,
            margin: const EdgeInsets.only(top: 320),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        '\nChamaleon I Molecular Cloud',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Text(
                        '2022-02-24',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Text(
                        'Beta Cygni is a single bright star to the naked eye.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
