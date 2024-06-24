import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/home.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({super.key});

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {

  TextEditingController controller = TextEditingController();

  String? city;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: TextField(
            controller: controller,
            style: const TextStyle(
              color: Colors.white,
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              setState(() {
                city = controller.text;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>HomeScreen(city: city!),));
              });
            },
            decoration: InputDecoration(
              suffix: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: 'Search'.toUpperCase(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

