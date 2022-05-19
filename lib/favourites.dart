import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ApiService/ApiService.dart';
import 'detailList.dart';
import 'model/apod.dart';
import 'widgets/detailWidget.dart';

class favourites extends StatefulWidget {
  const favourites({Key? key}) : super(key: key);

  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  late Future<List<Apod>> futurePost;
  ApiService apiService = new ApiService();
  String? id;

  getfavouriteApod() async {
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id');
    futurePost = apiService.getfavourite(id);
  }

  @override
  void initState() {
    super.initState();
    getfavouriteApod();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<Apod>>(
          future: apiService.getfavourite(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index) => Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  main(snapshot.data![index]))); //(aqui per anar a la llista de detall)
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].title}",
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.italic,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].explanation}"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}