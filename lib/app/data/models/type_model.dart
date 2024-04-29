import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TypeModel {
  String id;
  String name;
  TypeModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) =>
      TypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class UnitModel {
  String id;
  String name;
  UnitModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory UnitModel.fromMap(Map<String, dynamic> map) {
    return UnitModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UnitModel.fromJson(String source) =>
      UnitModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
