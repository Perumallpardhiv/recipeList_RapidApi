class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe({
    this.name,
    this.images,
    this.rating,
    this.totalTime,
  });

  factory Recipe.fromJson(dynamic json) {
    String link;
    if (json['images'] != null) {
      for (var i in json['images']) {
        link = i['hostedLargeUrl'];
      }
    }
    return Recipe(
      name: json['name'] as String ?? "Good",
      rating: json['rating'] as double ?? 10,
      totalTime: json['totalTime'] as String ?? "2 hrs",
      images: link as String ??
          "https://lh3.googleusercontent.com/XPsos76oBshUSj5eSzmv1IRR_MitnUPTWu0TLhWyYf6P1-j-Jv9os-ANK6JmqB3vIdgHJZVx_ciYzsr-KUnN9A=s360",
    );
  }

  static List<Recipe> recipeFromSnapshot(List snapshot) {
    return snapshot.map((e) {
      return Recipe.fromJson(e);
    }).toList();
  }

  @override
  String toString() {
    return "Recipe(name: $name, image: $images, rating: $rating)";
  }
}
