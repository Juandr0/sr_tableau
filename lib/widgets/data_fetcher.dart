import 'package:dio/dio.dart';
import 'package:school_sr_tableau/models/tableau.dart';
import 'package:intl/intl.dart';

class DataFetcher {
  final dio = Dio();
  final List<Tableau> tableauList = [];
  final defaultImageUrl =
      'https://cdn.iconscout.com/icon/free/png-256/free-no-image-1771002-1505134.png';

  Future<List<Tableau>> fetchFromApi(int channelIndex) async {
    final now = DateTime.now();
    final formattedCurrentTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    tableauList.clear();

    for (int i = 1; i <= 10; i++) {
      final response = await dio.get(getUrl(channelIndex) + i.toString());
      final responseSchedule =
          List<Map<String, dynamic>>.from(response.data['schedule']);

      tableauList.addAll(
        responseSchedule.where((data) {
          final endTime = formatTimeString(data['endtimeutc']);
          return endTime.compareTo(formattedCurrentTime) >= 0;
        }).map((data) {
          String? imageUrl = data['imageurl'] ?? defaultImageUrl;

          return Tableau(
            title: addSubtitleToTitle(data['title'], data['subtitle']),
            description: data['description'],
            startTime: formatTimeString(data['starttimeutc']),
            endTime: formatTimeString(data['endtimeutc']),
            imageString: imageUrl!,
          );
        }),
      );
    }

    return tableauList;
  }

  String getUrl(index) {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    switch (index) {
      case 0:
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=132&format=json&fromdate$today&page=';
      case 1:
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=163&format=json&fromdate$today&page=';
      case 2:
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=164&format=json&fromdate$today&page=';
    }
    return '';
  }

  String addSubtitleToTitle(String title, String? subtitle) {
    if (subtitle != null) {
      return '$title: $subtitle';
    } else {
      return title;
    }
  }

  ///Outputs the api format of time to a string that displays HH:mm
  String formatTimeString(String timestampString) {
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
