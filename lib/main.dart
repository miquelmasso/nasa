// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:nasa/apiService/ApiService.dart';
import 'package:nasa/widgets/apiwidgets.dart';
//import 'package:nasa/widgets/apiwidgetsdetall.dart';

import 'model/apod.dart';
import 'widgets/apiwidgetsdetall.dart';

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
                                builder: (context) => SecondRoute()),
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
  SecondRoute({Key? key}) : super(key: key);
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: FutureBuilder<Apod>(
        future: apiService.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              postlWidget(
                  snapshot.data!.title,
                  snapshot.data!.date,
                  snapshot.data!.copyright,
                  snapshot.data!.url,
                  snapshot.data!.explanation),
              ElevatedButton(
                child: const Text('SEGUENT'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdRoute()),
                  );
                },
              )
            ]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  ThirdRoute({Key? key}) : super(key: key);
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Logon'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
            FutureBuilder<Apod>(
              future: apiService.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return listApods();
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
