class ProductModel {
  int? idProduct;
  String? nameProduct;
  String? stockProduct;
  String? productValidity;
  ProductModel({
    this.idProduct,
    this.nameProduct,
    this.stockProduct,
    this.productValidity,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    idProduct = json['idProduct'];
    nameProduct = json['nameProduct'];
    stockProduct = json['stockProduct'];
    productValidity = json['productValidity'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProduct'] = this.idProduct;
    data['nameProduct'] = this.nameProduct;
    data['stockProduct'] = this.stockProduct;
    data['productValidity'] = this.productValidity;
    return data;
  }
}
