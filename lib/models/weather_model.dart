class Weather {
  final String cityName;
  final double temperature;
  final double pressure;
  final double humidity;
  final double minTemperature;
  final double maxTemperature;
  final double windSpeed;
  final String description;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.minTemperature,
    required this.maxTemperature,
    required this.windSpeed,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      minTemperature: json['main']['temp_min'].toDouble(),
      maxTemperature: json['main']['temp_max'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      description: json['weather'][0]['description'], // Première description
    );
  }
}
