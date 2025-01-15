import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; // location name for the UI
  late String time; // time in that location
  late String flag; // url to an asset flag icon
  late String url; //  location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    // Error Handling
    try{
      //   make the request
      Response response = await get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //   get properties from data
      String datetime = data['dateTime'];
      //   print(datetime);

      //   create DateTime object
      DateTime now = DateTime.parse(datetime);

      // set the time property
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
