class ProductsModel {
  String? name;
  String? dsc;
  String? img;
  num? price;
  int? rate;

  ProductsModel({
    this.name,
    this.dsc,
    this.img,
    this.price,
    this.rate,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      name: json['name'] as String?,
      dsc: json['dsc'] as String?,
      img: json['img'] as String?,
      price: json['price'] as num?,
      rate: json['rate'] as int?);
}
