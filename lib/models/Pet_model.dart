class PetModel {
  final String name;
  final int age;
  final int weight;
  final String color;
  final List<String> images;

  PetModel({
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
  });

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
        name: map['name'],
        age: (map['age'] as int) + 1,
        weight: (map['weight'] as int) + 1,
        color: map['color'],
        images: List<String>.from((map['images'] as List)));
  }
}
