import 'package:ecommerceapp/logic/controllers/productcontrollers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormtext extends StatelessWidget {
  SearchFormtext({Key? key}) : super(key: key);
  final ctrl = Get.find<ProductControllers>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllers>(
      builder: (_) {
        return TextField(
          controller: ctrl.searchValue,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              fillColor: Colors.white,
              focusColor: Colors.red,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: ctrl.searchValue.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear_sharp),
                      color: Colors.grey,
                      onPressed: () {
                        ctrl.clearSearchtolist();
                      },
                    )
                  : null,
              hintText: "Search with name & price...",
              hintStyle: TextStyle(
                  color: Colors.blueGrey[400],
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10))),
          onChanged: (value) {
            ctrl.addSearchtolist(value);
          },
        );
      },
    );
  }
}
