class PetModel {
  final String name;
  final int age;
  final int weight;
  final String color;
  final List<String> images;
  final String story;
  final String breed;
  final String gender;
  final String category;

  PetModel({
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
    required this.story,
    required this.breed,
    required this.gender,
    required this.category,
  });

  /// Converte um mapa JSON para uma instância de PetModel
  factory PetModel.fromJson(Map<String, dynamic> map) {
    return PetModel(
      name: map['name'] ?? '',
      story: map['story'] ?? '',
      breed: map['breed'] ?? '',
      gender: map['gender'] ?? '',
      category: map['category'] ?? '',
      age: (map['age'] is int) ? map['age'] : 0,
      weight: (map['weight'] is int) ? map['weight'] : 0,
      color: map['color'] ?? '',
      images: List<String>.from(map['images'] ?? []),
    );
  }

  /// Converte PetModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'images': images,
      'breed': breed,
      'gender': gender,
      'story': story,
      'category': category,
    };
  }

  /// Retorna um novo PetModel com uma nova URL adicionada
  PetModel addImage(String url) {
    return PetModel(
      name: name,
      story: story,
      age: age,
      weight: weight,
      gender: gender,
      breed: breed,
      color: color,
      images: [...images, url],
      category: category,
    );
  }
}
