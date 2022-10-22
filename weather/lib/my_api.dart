
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'add_weather.dart';
import 'package:http/http.dart';


class My_api{
static String ?my_country;

static void weather( String coun)
{
  my_country=coun;
  print(my_country);
}


static Future<Add_weather> get_weather()
async {
 // print(my_country);
Response future_weather = await get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$my_country,uk&APPID=00b213f265b97eeb9b41d553e0842de3'));
if(future_weather.statusCode==200)

return Add_weather.fromJason(json.decode(future_weather.body));


else
  throw Exception ('can not load the weather data');


}






}








