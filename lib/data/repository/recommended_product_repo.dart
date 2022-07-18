import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(Constants.RECOMMENDED_FOODS_URI);
  }
}
