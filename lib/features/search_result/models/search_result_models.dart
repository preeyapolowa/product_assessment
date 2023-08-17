class SearchResultModels {
  final String keyword;

  SearchResultModels(this.keyword);
}

class SearchResultDetailModel {
  late String imagePath;
  late String name;
  late int price;
  late String description;

  SearchResultDetailModel({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
  });

  SearchResultDetailModel.fromJson(Map<String, dynamic> json) {
    imagePath = json['image'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
  }
}
