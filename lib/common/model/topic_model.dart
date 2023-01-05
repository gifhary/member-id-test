class TopicModel {
  final int id;
  final String name;
  TopicModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  @override
  String toString() => 'TopicModel(id: $id, name: $name)';
}
