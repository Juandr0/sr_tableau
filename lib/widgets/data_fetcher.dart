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
              startTime: formatTimeFromTimestampString(data['starttimeutc']),
              endtime: formatTimeFromTimestampString(data['endtimeutc']),
              imageString: imageUrl!);
        },
      ),
    );

    return tableauList;
  }

  String formatTimeFromTimestampString(String timestampString) {
    final int startIndex = timestampString.indexOf('(') + 1;
    final int endIndex = timestampString.indexOf(')');
    if (startIndex >= 0 && endIndex >= 0) {
      final String timestampValue =
          timestampString.substring(startIndex, endIndex);
      final int timestamp = int.parse(timestampValue);
      final DateTime date =
          DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);

      final DateTime timeAsCET = date.add(const Duration(hours: 1));
      final String formattedTime =
          '${timeAsCET.hour.toString().padLeft(2, '0')}:${timeAsCET.minute.toString().padLeft(2, '0')}';
      return formattedTime;
    }
    return '';
  }
}
