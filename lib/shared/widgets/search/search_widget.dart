import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Pesquisar produto",
                  suffixIcon: const Icon(Icons.search, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list_alt,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
