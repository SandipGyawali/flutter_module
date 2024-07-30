import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_m/components/input_field.dart';
import 'package:flutter_m/provider/weather_provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatefulWidget {
  @override
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPage();
}

class _WeatherPage extends State<WeatherPage> {
  final _locationController = TextEditingController();

  var weatherProvider;

  @override
  void initState() {
    super.initState();
    // weatherProvider = Provider.of<WeatherProvider>(
    //   context,
    //   listen: false,
    // );
    // weatherProvider.getCurrentWeather("London", context);
  }

  locationControllerCheck(String value) {
    weatherProvider.getCurrentWeather(value, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        var data;
        var weatherStatus;
        var temp;

        if (weatherProvider.weatherData != null) {
          data = weatherProvider.weatherData;
          weatherStatus = data["weather"][0]["main"];
          temp = data["main"];
        }

        return weatherProvider.getIsLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : weatherProvider.weatherData == null
                ? const Text("Erro while fetching data")
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.white),
                          padding: const EdgeInsets.only(
                            top: 0,
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Hello,",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 21,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const Text(
                                "Today's Weather",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InputField(
                                label: "",
                                obscure: false,
                                hintText: "Search...",
                                controller: _locationController,
                                suffixIcon: const HugeIcon(
                                  icon: HugeIcons.strokeRoundedSearch02,
                                  color: Colors.black54,
                                  size: 24.0,
                                ),
                                onInputSubmit: locationControllerCheck(
                                  _locationController.text,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 30),
                                const HugeIcon(
                                  icon: HugeIcons.strokeRoundedLocation09,
                                  color: Colors.black54,
                                  size: 24.0,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${data["name"]}",
                                  style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Image.asset(
                                  weatherStatus == "Rain"
                                      ? "assets/rainy_weather.webp"
                                      : weatherStatus == "Cloud"
                                          ? "assets/cloudy_weather.png"
                                          : "assets/sunny_weather.webp",
                                  width: 120,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "${temp["temp"]}K",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
      },
    );
  }
}
