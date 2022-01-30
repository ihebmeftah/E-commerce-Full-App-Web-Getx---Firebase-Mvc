import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/services/categoryservices.dart';
import 'package:get/get.dart';

class CategoryControlle extends GetxController {
  var categoryName = <String>[].obs;
  var categoryAll = <ProductModels>[].obs;
  var catLoading = false.obs;
  var catALLLoading = false.obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;
  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  getCategory() async {
    catLoading(true);
    var categoryadd = await CategoryServices.getCategory();
    try {
      if (categoryName.isEmpty) {
        categoryName.addAll(categoryadd);
      }
    } finally {
      catLoading(false);
    }
  }

  getAllCategory(String categoryname) async {
    catALLLoading(true);
    var categoryALLadd = await AllCategoryServices.getAllCategory(categoryname);
    try {
      if (categoryALLadd.isNotEmpty) {
        categoryAll.value = categoryALLadd;
      }
    } finally {
      catALLLoading(false);
    }
  }
}
