import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';

import '../model/popular_products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).product);
      update();
    } else {}
  }
}
