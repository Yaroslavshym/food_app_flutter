class ProductEntity {
  final String name;
  final String description;
  final String category;
  final num ratings;
  final num distance;
  final num currentPrice;
  final num newPrice;
  ProductEntity({
    required this.category,
    required this.name,
    required this.description,
    required this.ratings,
    required this.distance,
    required this.currentPrice,
    required this.newPrice,
  });
}
