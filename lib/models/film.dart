class Film {
  final String id;
  final String title;
  final String description;
  final String director;
  final String releaseDate;
  final String image;

  Film({
    required this.id,
    required this.title,
    required this.description,
    required this.director,
    required this.releaseDate,
    required this.image,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      director: json['director'],
      releaseDate: json['release_date'],
      image: json['image'] ?? '', // some entries might lack images
    );
  }
}
