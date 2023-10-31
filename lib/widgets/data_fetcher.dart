import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:school_sr_tableau/models/tableau.dart';

class DataFetcher {
  final dio = Dio();
  final List<Tableau> tableauList = [];
  Future<List<Tableau>> fetchFromApi(
      String urlString, int currentChannel) async {
    tableauList.clear();
    final response = await dio.get(urlString);
    final responseSchedule = List<Map<String, dynamic>>.from(
      response.data['schedule'],
    );

    final List<Color> colorsList = [
      const Color.fromARGB(255, 74, 148, 177),
      const Color.fromARGB(255, 233, 91, 39),
      const Color.fromARGB(255, 70, 157, 107),
    ];

    tableauList.addAll(
      responseSchedule.map(
        (data) {
          String? imageUrl = data['imageurl'] ??
              'https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061131_640.png';

          return Tableau(
              title: data['title'],
              description: data['description'],
              startTime: data['starttimeutc'],
              endtime: data['endtimeutc'],
              imageString: imageUrl!,
              themeColor: colorsList[currentChannel]);
        },
      ),
    );
    return tableauList;
  }
}
