class People {
  final int id;
  final String title;
  final String description;
  final String director;
  final String producer;
  final String people;
  final String species;
  final String locations;
  final String vehicles;

 People({
    required this.id,
    required this.title,
    required this.description,
    required this.director,
    required this.producer,
    required this.people,
    required this.species,
    required this.locations,
    required this.vehicles,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      director: json['director'],
      producer: json['producer'],
      people: json['people'],
      species: json['species'],
      locations: json['locations'],
      vehicles: json['vehicles'],
    );
  }
}
