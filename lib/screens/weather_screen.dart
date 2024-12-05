import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Weather>> _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = _fetchWeatherData();
  }

  Future<List<Weather>> _fetchWeatherData() async {
    // Ajoutez les villes que vous souhaitez afficher
    final cities = ['Tunis'];
    final List<Weather> weatherList = [];
    for (var city in cities) {
      final weather = await _apiService.fetchWeather(city);
      weatherList.add(weather);
    }
    return weatherList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Smart Baro'
        ,style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: FutureBuilder<List<Weather>>(
        future: _weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final weatherList = snapshot.data!;
            return ListView.builder(
  itemCount: weatherList.length,
  itemBuilder: (context, index) {
    final weather = weatherList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ville
        Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white, // Fond blanc
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: // Ville
Card(
  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  color: Colors.white, // Fond blanc
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  child: ListTile(
    leading: Icon(
      Icons.location_on, // Icône de localisation
      color: Colors.blue, // Couleur de l'icône
      size: 40, // Taille de l'icône
    ),
    title: Text(
      'Ville',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text(weather.cityName),
  ),
),

        ),

                // Pression atmosphérique
        Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white, // Fond blanc
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.compress, color: Colors.blueGrey, size: 40),  // Icone pour pression
            title: Text(
              'Pression atmosphérique',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${weather.pressure} hPa'),
          ),
        ),


        // Température actuelle
        Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white, // Fond blanc
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.thermostat, color: Colors.orange, size: 40),
            title: Text(
              'Température actuelle',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${weather.temperature}°C'),
          ),
        ),

        // Température min/max
        Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white, // Fond blanc
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.thermostat_outlined, color: Colors.blue, size: 40),
            title: Text(
              'Température min/max',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Min: ${weather.minTemperature}°C, Max: ${weather.maxTemperature}°C'),
          ),
        ),


        // Humidité
        Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white, // Fond blanc
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.water_drop, color: Colors.blue, size: 40),  // Icone pour humidité
            title: Text(
              'Humidité',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${weather.humidity}%'),
          ),
        ),

        // Vitesse du vent
        Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white, // Fond blanc
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.air, color: Colors.cyan, size: 40),
            title: Text(
              'Vitesse du vent',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${weather.windSpeed} m/s'),
          ),
        ),

        // Description du temps
        Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.white, // Fond blanc
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.cloud, color: Colors.grey, size: 40),
            title: Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(weather.description),
          ),
        ),
        
        SizedBox(height: 10), // Espacement entre chaque groupe de données
      ],
    );
  },
);


          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
