class CategoryModel {
  final int id;
  final String name;
  final String slug;
  bool isSelected;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    this.isSelected =
        false, // Establecer el valor predeterminado de isSelected a false
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}
