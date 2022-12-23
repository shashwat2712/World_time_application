import 'package:flutter/material.dart';
import 'world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_application/pages/choose_location.dart';



class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {






  //to get the endpoint of the api or the source from where we are getting the
  // data we use get()


  // void getData() async {
  //   //response type is given to us by the http module and it contains info about
  //   // the response that we get from this request.
  //   Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //   // print(response.body);
  //   //response.body will look like a map but it is not it is basically a string
  //   //which represents the object i.e. json string
  //
  //   //so to convert this json string into a data we can work with.
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  //
  // }

  // void getTime () async{
  //
  //   //make the request
  //   Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
  //   Map data = jsonDecode(response.body);
  //   // print(data);
  //
  //   //get properties from the data
  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'];
  //   // print(datetime);
  //
  //   //Create DateTime object
  //   DateTime now = DateTime.parse(datetime);
  //   print(now);
  //
  // }
 String time = 'loading';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'India', url: 'Europe/London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      //to pass all the data to the redirected page we use arguments which
      //here ultimately makes a map which can be used in the redirected page
      'location': instance.location,
      'time': instance.time,
      'flag':instance.flag,
      'isDaytime': instance.isDaytime,
    }
    );
  }




  void initState(){
    super.initState();

    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue[900] ,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),

      ),
    );
  }
}
