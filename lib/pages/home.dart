import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}
//It links state object with the widget

class _HomeState extends State<Home> {

  Map data = {};




  @override
  Widget build(BuildContext context) {
    // inside the build method we receive the actual arguments which we made
    // previously


    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget> [
                  TextButton.icon(
                      onPressed: () async{
                        dynamic reference = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': reference['time'],
                            'location' : reference['location'],
                            'isDaytime': reference['isDaytime'],
                            'flag': reference['flag']
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location,
                      color: Colors.blue[900]),

                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20.0,
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                      Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.black,


                      ),
                      )
                      ]
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text(
                        data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      letterSpacing: 2.0,

                    ),),
                  ),
                ],


              ),
            )
        ],
      ),
          )),
    );
  }
}
