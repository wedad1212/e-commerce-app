
import 'package:ecommerce/core/class/statues_request.dart';
import 'package:ecommerce/core/model/category_model.dart';
import 'package:ecommerce/core/services/get_categories.dart';
import 'package:get/get.dart';

abstract class CategoryController extends GetxController {
  getCategories();
}

class CategoryControllerImp extends CategoryController {
  List<CategoryModel> listCategories = [];
  StatuesRequest? statuesRequest;
  late CategoryModel categoryModel;
  GetCategoriesService? getCategoriesService;
  CategoryControllerImp() {
    getCategories();
  }

  @override
  getCategories() async {
    getCategoriesService = GetCategoriesService();
    statuesRequest = StatuesRequest.loading;
    update();
    await getCategoriesService!.getCategories().then((value) {
      categoryModel = CategoryModel("", "");
      for (int i = 0; i < value.length; i++) {
        listCategories.add(
            categoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
      }
      update();
    });
    statuesRequest = StatuesRequest.success;
    update();
  }
}
