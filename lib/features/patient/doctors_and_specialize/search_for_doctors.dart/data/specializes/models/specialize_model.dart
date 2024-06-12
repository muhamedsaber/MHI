class SpecializeModel {
   final String id;
   final String name;
    SpecializeModel({
      required this.id,
      required this.name,
    });
    factory SpecializeModel.fromJson(Map<String, dynamic> json) {
      return SpecializeModel(
        id: json['_id'],
        name: json['name'],
      );
    }
    Map<String, dynamic> toJson() {
      return {
        "_id": id,
        "name": name,
      };
    }
}