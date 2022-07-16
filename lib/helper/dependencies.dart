import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Api Client
  Get.lazyPut(() => ApiClient(appBaseUrl: ""));

  //Repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
