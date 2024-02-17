class Temperatures {
  String cod;
  int message;
  int cnt;
  List<ListElement> list;
  City city;

  Temperatures(
     this.cod,
     this.message,
     this.cnt,
     this.list,
     this.city,
  );

}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

}

class Coord {
  double lat;
  double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

}

class ListElement {
  int dt;
  MainClass main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
  Sys sys;
  DateTime dtTxt;
  Snow? snow;

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    this.snow,
  });

}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

}

class MainClass {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  MainClass({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

}

class Snow {
  double the3H;

  Snow({
    required this.the3H,
  });

}

class Sys {
  Pod pod;

  Sys({
    required this.pod,
  });

}

enum Pod {
  D,
  N
}

class Weather {
  int id;
  MainEnum main;
  Description description;


  Weather({
    required this.id,
    required this.main,
    required this.description,
  });

}

enum Description {
  BROKEN_CLOUDS,
  LIGHT_SNOW,
  OVERCAST_CLOUDS,
  SNOW
}


enum MainEnum {
  CLOUDS,
  SNOW
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

}
