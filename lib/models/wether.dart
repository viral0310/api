class Weather {
  final String name;
  final String desription;
  final String team;
  final String humidity;
  final String speed;
  final String degree;

  Weather({
    required this.name,
    required this.degree,
    required this.desription,
    required this.humidity,
    required this.speed,
    required this.team,
  });
  factory Weather.fromjson({required Map<String, dynamic> json}) {
    return Weather(
        name: json['weather'][0]['main'],
        degree: json['wind']['deg'],
        desription: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        speed: json['wind']['speed'],
        team: json['wind']['deg']);
  }
}
