import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_type/shared/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/widgets/button/button_widget.dart';
import '../../shared/widgets/text_form/text_form_widget.dart';

class ProductRegister extends StatefulWidget {
  const ProductRegister({Key? key}) : super(key: key);
  @override
  State<ProductRegister> createState() => _ProductRegisterState();
}

class _ProductRegisterState extends State<ProductRegister> {
  var dataProduct = <ProductModel>[];

  var nameProductController = TextEditingController();
  var stockProductController = TextEditingController();
  var validityProductController = TextEditingController();

  void add() {
    setState(() {
      dataProduct.add(
        ProductModel(
          nameProduct: nameProductController.text,
          stockProduct: stockProductController.text,
          productValidity: validityProductController.text,
        ),
      );
      saveProduct();
    });
  }

  saveProduct() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(dataProduct));

    Navigator.pop(context);
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
            controller: nameProductController,
          ),
          TextFormWidget(
            title: "Quantidade",
            hintText: "Quantidade",
            controller: stockProductController,
          ),
          TextFormWidget(
            title: "Validade",
            hintText: "Validade",
            controller: validityProductController,
          ),
        ],
      ),
      bottomNavigationBar: ButtonWidget(
        onPressed: () {
          add();
        },
      ),
    );
  }
}
