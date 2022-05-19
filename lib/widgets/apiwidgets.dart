import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:nasa/apiService/ApiService.dart';
import 'dart:html';

import 'package:nasa/model/apod.dart';

class listApods extends StatelessWidget {
  const listApods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Apod>>(
          future: apiService.getList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff97FFFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // IconButton(
                        //   icon: const Icon(Icons.volume_up),
                        //   tooltip: 'Increase volume by 10',
                        //   onPressed: () {
                        //     setState(() {
                        //       _volume += 10;
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
