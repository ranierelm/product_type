class ProductModel {
  late String nameProduct;
  late String stockProduct;
  late String productValidity;
  ProductModel({
    required this.nameProduct,
    required this.stockProduct,
    required this.productValidity,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    nameProduct = json['nameProduct'];
    stockProduct = json['stockProduct'];
    productValidity = json['productValidity'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameProduct'] = this.nameProduct;
    data['stockProduct'] = this.stockProduct;
    data['productValidity'] = this.productValidity;
    return data;
  }
}
