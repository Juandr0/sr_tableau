import 'package:dio/dio.dart';
import 'package:school_sr_tableau/models/tableau.dart';

class DataFetcher {
  final dio = Dio();
  final List<Tableau> tableauList = [];

  Future<List<Tableau>> fetchFromApi(String urlString) async {
    tableauList.clear();
    final response = await dio.get(urlString);
    final responseSchedule = List<Map<String, dynamic>>.from(
      response.data['schedule'],
    );

    tableauList.addAll(
      responseSchedule.map(
        (data) {
          String? imageUrl = data['imageurl'] ??
              'https://cdn.iconscout.com/icon/free/png-256/free-no-image-1771002-1505134.png';

          return Tableau(
              title: data['title'],
              description: data['description'],
              startTime: data['starttimeutc'],
              endtime: data['endtimeutc'],
              imageString: imageUrl!);
        },
      ),
    );

    return tableauList;
  }
}
