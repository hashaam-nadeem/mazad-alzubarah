class DepartmentsAttribute {
  final bool withError;
  final String shortMessage;
  final List<AttributeResult> result;

  DepartmentsAttribute({
    this.withError,
    this.result,
    this.shortMessage,
  });

  factory DepartmentsAttribute.fromJson(Map<String, dynamic> json) {
    return DepartmentsAttribute(
      withError: json['error'],
      shortMessage: json['message'],
      result: (json['data'] as List)
              .map((e) => AttributeResult.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class AttributeResult {
  var id;
  var departmentId;
  var attributeOptionId;
  var attributeId;
  List<AttributeOptions> attributeOptions;
  Attribute attribute;
  AttributeResult(
      {this.id,
      this.attributeId,
      this.attributeOptions,
      this.attribute,
      this.attributeOptionId,
      this.departmentId});

  factory AttributeResult.fromJson(Map<String, dynamic> json) {
    return AttributeResult(
      attribute: Attribute.fromJson(json['attribute']),
      attributeOptions: (json['options'] as List)
          .map((e) => AttributeOptions.fromJson(e))
          .toList(),
      id: json['id'] ?? "",
      departmentId: json['department_id'] ?? "",
      attributeId: json['attribute_id'] ?? "",
      attributeOptionId: json['attribute_option_id'] ?? "",
    );
  }
}

class Attribute {
  var id;
  String name;
  String arabicName;

  Attribute({this.id, this.name, this.arabicName});
  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        arabicName: json["arabic_name"] ?? "");
  }
}

class AttributeOptions {
  var id;
  var name;
  var arabicName;
  Option option;
  AttributeOptions({
    this.id,
    this.option,
    this.arabicName,
    this.name,
  });

  factory AttributeOptions.fromJson(Map<String, dynamic> json) {
    return AttributeOptions(
      option: Option.fromJson(json['option']),
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      arabicName: json['arabic_name'] ?? "",
    );
  }
}

class Option {
  var id;
  String name;
  String arabicName;
  var type;
  List values;
  Option({this.id, this.values, this.name, this.type, this.arabicName});
  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        type: json['type'] ?? "",
        values: json['value'] ?? [],
        arabicName: json["arabic_name"] ?? "");
  }
}

class Images {
  String thumbnail;
  String original;
  String normal;
  Images({this.thumbnail, this.original, this.normal});
  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      thumbnail: json['thumbnail'] ?? 0,
      original: json['orignal'] ?? "",
      normal: json['normal'] ?? "",
    );
  }
}
