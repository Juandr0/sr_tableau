import 'package:dio/dio.dart';
import 'package:school_sr_tableau/models/radio_channel.dart';
import 'package:school_sr_tableau/models/radio_tableau.dart';
import 'package:intl/intl.dart';

class DataFetcher {
  final dio = Dio();

  final defaultImageUrl =
      'https://cdn.iconscout.com/icon/free/png-256/free-no-image-1771002-1505134.png';

  /// Fetches all radio channels
  Future<List<RadioChannel>> fetchAllP4Channels() async {
    final List<RadioChannel> channelList = [];
    final response = await dio
        .get('https://api.sr.se/v2/channels?format=json&page=1&size=60');
    final responseChannels =
        List<Map<String, dynamic>>.from(response.data['channels']);

    channelList.addAll(
      responseChannels.where((data) {
        return data['name'][1] == "4";
      }).map((data) {
        return RadioChannel(data['name'], data['id'], data['image']);
      }),
    );

    return channelList;
  }

  /// Fetches individual radio channel schedule via index or id
  Future<List<RadioTableau>> fetchRadioChannelSchedule(
      String channel, int? channelId) async {
    final List<RadioTableau> tableauList = [];
    final now = DateTime.now();
    final formattedCurrentTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    tableauList.clear();

    final response = await dio.get(
      getUrl(channel, channelId),
    );
    final responseSchedule =
        List<Map<String, dynamic>>.from(response.data['schedule']);

    tableauList.addAll(
      responseSchedule.where((data) {
        final endTime = formatTimeString(data['endtimeutc']);
        return endTime.compareTo(formattedCurrentTime) >= 0;
      }).map((data) {
        String? imageUrl = data['imageurl'] ?? defaultImageUrl;
        return RadioTableau(
          title: addSubtitleToTitle(data['title'], data['subtitle']),
          description: data['description'],
          startTime: formatTimeString(data['starttimeutc']),
          endTime: formatTimeString(data['endtimeutc']),
          imageString: imageUrl!,
        );
      }),
    );

    return tableauList;
  }

  String getUrl(String channel, int? channelId) {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (channelId != null) {
      return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=$channelId&format=json&fromdate$today&size=150';
    }
    switch (channel) {
      case 'p1':
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=132&format=json&fromdate$today&size=150';
      case 'p2':
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=163&format=json&fromdate$today&size=150';
      case 'p3':
        return 'https://api.sr.se/api/v2/scheduledepisodes?channelid=164&format=json&fromdate$today&size=150';
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
