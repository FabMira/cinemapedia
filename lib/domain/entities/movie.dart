import 'package:isar/isar.dart';

part 'movie.g.dart';

@Collection() // Usamos la forma estándar
class Movie {
  Id? isarId; // Esto está bien para auto-incremento

  final bool adult;
  final String backdropPath;
  final List<String> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    this.isarId, // Agregamos como parámetro opcional para flexibilidad
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  String toString() => 'Movie(isarId: $isarId, id: $id, title: $title)';
}