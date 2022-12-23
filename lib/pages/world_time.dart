import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //location name in the ui
  late String time; //the time in that location
  String flag; //url to asset flag icon
  String url;  //location url for api endpoint
  late bool isDaytime;//true or false if daytime or not


  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime () async{

  //make the request
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String hours = offset.substring(1, 3);
      String minutes = offset.substring(4, 6);
      // print(datetime);

      //Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));

      //Set the time property
      isDaytime = (now.hour >6 && now.hour<19)? true:false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Unable to load the data due to $e');
      time = 'unable to load the data';
    }
  }

}