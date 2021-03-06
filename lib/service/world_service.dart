import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String time;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offsetHrs = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4);

      print('time $datetime and offsetHrs: $offsetHrs offsetMin: $offsetMin ');

      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offsetHrs), minutes: int.parse(offsetMin)));
      print(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error : $e');
      time = 'Unable to get Time';
    }
  }
}
