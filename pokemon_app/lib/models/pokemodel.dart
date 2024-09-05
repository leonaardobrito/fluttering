// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pokemon {
  final String name;
  final String imageUrl;
  final int id;
  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.id,
  });

  Pokemon copyWith({
    String? name,
    String? imageUrl,
    int? id,
  }) {
    return Pokemon(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'id': id,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) => Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Pokemon(name: $name, imageUrl: $imageUrl, id: $id)';

  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.imageUrl == imageUrl &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ imageUrl.hashCode ^ id.hashCode;
}
