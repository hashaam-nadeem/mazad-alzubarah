class AllDepartments {
  final bool withError;
  final String shortMessage;
  final List<AllDepartmentResult> result;

  AllDepartments({
    this.withError,
    this.result,
    this.shortMessage,
  });

  factory AllDepartments.fromJson(Map<String, dynamic> json) {
    return AllDepartments(
      withError: json['error'],
      shortMessage: json['message'],
      result: (json['data'] as List)
              .map((e) => AllDepartmentResult.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class AllDepartmentResult {
  var id;
  var type;
  var name;
  var slug;
  var arabicName;
  Images images;

  AllDepartmentResult(
      {this.id, this.arabicName, this.images, this.name, this.slug, this.type});

  factory AllDepartmentResult.fromJson(Map<String, dynamic> json) {
    return AllDepartmentResult(
      images: Images.fromJson(json['image_path']),
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      name: json['name'] ?? "",
      arabicName: json['arabic_name'] ?? "",
      slug: json['slug'] ?? "",
    );
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
