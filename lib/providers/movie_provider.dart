import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final List<String> _movieList = [
    "The godfatger9",
    "The godfatger1",
    "The godfatger2",
    "The godfatger3",
    "The godfatger4",
  ];

  List<String> get movieList => movieList;
  List<String> loadMovies() {
    return _movieList;
  }
}
