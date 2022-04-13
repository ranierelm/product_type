import 'package:flutter/material.dart';
import 'package:product_type/shared/widgets/search/search_widget.dart';

import '../../shared/models/product_model.dart';

class ProductType extends StatefulWidget {
  var data = ProductModel();
  var dataProduct = <ProductModel>[];
  ProductType() {
    dataProduct = [];
  }

  @override
  State<ProductType> createState() => _ProductTypeState();
}

class _ProductTypeState extends State<ProductType> {
  var inputProductController = TextEditingController();
  var controller = ProductModel();

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
              itemCount: widget.dataProduct.length,
              itemBuilder: (context, index) {
                final productList = widget.dataProduct[index];

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
                                    child: Text("N: ${widget.data.idProduct}",
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
                                    Text("${widget.data.idProduct}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          height: 1.7,
                                        )),
                                    Text("Estoque: ${widget.data.idProduct}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          height: 1.7,
                                        )),
                                    Text("Validade: ${widget.data.idProduct}",
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
        onPressed: () {
          Navigator.pushNamed(context, "/product_register");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
