import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_type/shared/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/widgets/button/button_widget.dart';
import '../../shared/widgets/text_form/text_form_widget.dart';

class ProductRegister extends StatefulWidget {
  var dataProduct = <ProductModel>[];

  ProductRegister() {
    dataProduct = [];
  }
  @override
  State<ProductRegister> createState() => _ProductRegisterState();
}

class _ProductRegisterState extends State<ProductRegister> {
  var controller = ProductModel();

  var inputProductController = TextEditingController();

  void add() {
    if (inputProductController.text.isEmpty) return;
    setState(() {
      widget.dataProduct.add(
        ProductModel(
          idProduct: inputProductController.hashCode,
          nameProduct: inputProductController.text,
          stockProduct: inputProductController.text,
          productValidity: inputProductController.text,
        ),
      );
      inputProductController.clear();
      saveProduct();
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<ProductModel> result =
          decoded.map((x) => ProductModel.fromJson(x)).toList();
      setState(() {
        widget.dataProduct = result;
      });
    }
  }

  saveProduct() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.dataProduct));
  }

  _ProductRegisterState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastrar produto",
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          TextFormWidget(
            title: "Nome",
            hintText: "Nome",
            onChanged: (value) {
              setState(() {
                controller.nameProduct = value;
                saveProduct();
              });
            },
          ),
          TextFormWidget(
            title: "Quantidade",
            hintText: "Quantidade",
            onChanged: (value) {
              setState(() {
                controller.stockProduct = value;
                saveProduct();
              });
            },
          ),
          TextFormWidget(
            title: "Validade",
            hintText: "Validade",
            onChanged: (value) {
              setState(() {
                controller.productValidity = value;
                saveProduct();
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: ButtonWidget(
        onPressed: add,
      ),
    );
  }
}
