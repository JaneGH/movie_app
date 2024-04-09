import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => MovieProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Removed 'super.key'

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              Colors.deepPurple, // Changed seedColor to primarySwatch
        ),
        useMaterial3: true,
      ),
      home: const Home(), // Removed 'Placeholder()' and replaced with 'Home()'
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context)
        .loadMovies(); // Moved inside build method

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'), // Wrapped 'Text' widget with 'const'
      ),
      body: Center(
        child: ListView.builder(
          itemCount:
              movies.length, // Changed to use 'movies' instead of '_movieList'
          itemBuilder: (context, index) {
            return Text(
                movies[index]); // Removed 'const' since content is dynamic
          },
        ),
      ),
    );
  }
}
