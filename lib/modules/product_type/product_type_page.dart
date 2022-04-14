import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_type/shared/widgets/search/search_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/product_model.dart';

class ProductType extends StatefulWidget {
  const ProductType({Key? key}) : super(key: key);

  @override
  State<ProductType> createState() => _ProductTypeState();
}

class _ProductTypeState extends State<ProductType> {
  var dataProduct = <ProductModel>[];
  var inputProductController = TextEditingController();

  Future load() async {
    var instance = await SharedPreferences.getInstance();
    var data = instance.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<ProductModel> result =
          decoded.map((x) => ProductModel.fromJson(x)).toList();
      setState(() {
        dataProduct = result;
      });
    }
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: const Text(
          "Tipos de produtos",
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          const SearchWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: dataProduct.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 30,
                            color: const Color(0XFFd3eafc),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text("N: 1",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16)),
                                  )
                                ]),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Detalhes do produto",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(dataProduct[index].nameProduct,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          height: 1.7,
                                        )),
                                    Text(
                                        "Estoque: ${dataProduct[index].stockProduct}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          height: 1.7,
                                        )),
                                    Text(
                                        "Validade: ${dataProduct[index].productValidity}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          height: 1.7,
                                        ))
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/product_register");
          load();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
