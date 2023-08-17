class CategoryModel {
  String name, image;

  CategoryModel(this.name, this.image);

  CategoryModel fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return CategoryModel("", "");
    }
    return CategoryModel(name = map['name'], image = map['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': num,
      'image': image,
    };
  }
}
