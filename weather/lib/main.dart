import 'dart:developer';
import 'dart:ui';
import 'add_weather.dart';
import 'package:http/http.dart';


import 'package:flutter/material.dart';
import 'package:weather/add_weather.dart';
import 'package:weather/my_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    
    );
  }
}
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

String? country;
Future<Add_weather>? mine;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Weather',
        
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),
        
        
        
        
        
        ) ,

      ),
       
       body: Center(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(
                      width: 200,
                       child: TextFormField(
                        
                        decoration: InputDecoration(
                          

                          hintText: "Enter the country",
                          
                          
                    
                            
                            
                           
                           ),
                           onChanged: (value)
                           {
                            setState(() {
                              country=value;
                              
                            });
                           },
                            
                       ),
                     ),
                          
                     ElevatedButton(
                      onPressed: (()
                        {
                        
                         My_api.weather(country!) ;
                        setState(() {
                        
                          
                        });
                        
                      }), 
                      child: Text('Search',
                       style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                      
                      
                      
                      
                      )
                       )
                       )
                          
                          
                          
                          
                          
                    ],
                  ),
                ),
          
                FutureBuilder<Add_weather>(
                  future: My_api.get_weather()
                  ,
                  builder: (context,Snapshot){
          
                    if (Snapshot.hasData){
                    Add_weather x=Snapshot.data!;
                    return Container(
                      width: 400,
                      height: 200,
                      child: Column(
                        children: [
                          Text('The temperature is ${x.temp.toString()}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ), 
                          
                          
                          
                          ),
                          
                          SizedBox(
                            height: 10,
                          ),





                          Text('You feel like it is ${x.feelsLike.toString()}',
                            
                          style: TextStyle(
                                     fontSize: 15,
                                        color: Colors.red,
                           

                          ),
                          
                          
                          ),


                           SizedBox(
                            height: 10,
                          ),


                          Text('The low temperature is ${x.low.toString()}',
                          
                          style: TextStyle(
                                     fontSize: 15,
                                        color: Colors.red,
                           

                          ),
                          ),

                           SizedBox(
                            height: 10,
                          ),

                          
                          Text('The high temperature is ${x.high.toString()}',
                            
                          style: TextStyle(
                                     fontSize: 15,
                                        color: Colors.red,
                           

                          ),
                          
                          
                          
                          
                          
                          ),
                        ],),
                    );
                  }
                  else
                  return CircularProgressIndicator();
                  
                  }
                  
                  
                  )
          
          
          
              ]),
          ),
        ) ,)
       
    







      
    );
  }
}
