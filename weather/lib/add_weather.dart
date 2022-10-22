class Add_weather{
   late double ? temp;
   late double ? low;
   late double ? high;
   late double ?feelsLike;

     

Add_weather({this.temp,this.low,this.high,this.feelsLike});
factory Add_weather.fromJason(Map <String,dynamic> weather)

  {return Add_weather(
    temp: weather['main']['temp'],
    feelsLike: weather['main']['feels_like'],
    low: weather['main']['temp_min'],
    high: weather['main']['temp_max']
  );

  }




}