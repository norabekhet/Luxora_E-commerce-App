class OffersModel {
  final String id;
  final String name;
  final String description;

  OffersModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory OffersModel.fromjson(Map<String, dynamic> json) {
    return OffersModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
