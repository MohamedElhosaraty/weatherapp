import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';

class HomeScreen extends StatefulWidget {

  final String city;
   HomeScreen({super.key, required this.city});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    BlocProvider.of<WeatherCubit>(context).getDataWeather(widget.city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey,
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if(state is WeatherLoaded){
              return const Center(child: CircularProgressIndicator(),);
          }
          if(state is WeatherSuccess){
           final  data = state.weather;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.timezone.toString(), style:const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "flutterfonts"
                  ),
                  ),
                   Text(
                    data.name, style:const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "flutterfonts"
                  ),
                  ),
                   Text(
                    data.weather[0].main, style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "flutterfonts"
                  ),
                  ),
                   Text(
                    data.weather[0].description, style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "flutterfonts"
                  ),
                  ),

                ],
              ),
            );
          }
          if(state is WeatherFailure){
            return Center(child: Text(state.errorMessage));
          }
          return const Text('');
        },
      ),
    );
  }
}
