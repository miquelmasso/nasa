import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:nasa/apiService/ApiService.dart';
import 'dart:html';

import 'package:nasa/model/apod.dart';

class postlWidget extends StatelessWidget {
  String title;
  String date;
  String copyright;
  String url;
  String explanation;

  postlWidget(
      this.title, this.date, this.copyright, this.url, this.explanation);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          margin: const EdgeInsets.only(top: 320),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 18),
                Text(
                  copyright,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  date,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(
                  explanation,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
