import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

import '../model/popular_products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).product);
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(++_quantity);
    } else {
      _quantity = checkQuantity(--_quantity);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't reduce more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItems > 0) {
        return -_inCartItems;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item count", "You can't add more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    final exist = _cart.existInCart(product);
    //Get from storage
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("This id is " +
          value.id.toString() +
          ". The quantity is " +
          value.quantity.toString());
    });

    update();
  }

  int get totalItems => _cart.totalItems;

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
