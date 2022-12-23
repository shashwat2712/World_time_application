
import 'package:flutter/material.dart';
import 'package:world_time_application/pages/home.dart';
import 'package:world_time_application/pages/loading.dart';
import 'package:world_time_application/pages/choose_location.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    //this is a type of map(dictionary) which contain key value pairs.
    //Keys are the actual routes themselves.
    //And values are the function which takes context as the arguments and
    //returns widget.

    '/': (context) =>Loading(),// '/' is known as the base route which by default
    // loads on the screen
    '/home': (context) => Home(),
    '/location':(context) =>ChooseLocation(),
  },
));



