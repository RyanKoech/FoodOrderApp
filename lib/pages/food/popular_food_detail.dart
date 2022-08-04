import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/model/popular_products_model.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:food_delivery/widgets/main_info_column.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  PopularFoodDetail({
    required this.pageId,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.size350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    Constants.BASE_URL + Constants.UPLOADS_URI + product.img!,
                  ),
                ),
              ),
            ),
          ),
          //Action Icons
          Positioned(
            top: Dimensions.size45,
            left: Dimensions.size20,
            right: Dimensions.size20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (page == "cartpage") {
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.arrow_back),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.totalItems >= 1) {
                        Get.toNamed(RouteHelper.getCartPage());
                      }
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        (controller.totalItems >= 1)
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              )
                            : Container(),
                        (controller.totalItems >= 1)
                            ? Positioned(
                                right: 3,
                                top: 3,
                                child: BigText(
                                  text: controller.totalItems.toString(),
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          //Body
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.size350 - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.size20,
                right: Dimensions.size20,
                top: Dimensions.size20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Dimensions.size20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainInfoColumn(
                    text: product.name!,
                  ),
                  SizedBox(
                    height: Dimensions.size20,
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.size20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text: product.description!,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Container(
            height: Dimensions.size120,
            padding: EdgeInsets.all(Dimensions.size20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.size20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.size20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.size20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.setQuantity(false);
                          },
                          child:
                              Icon(Icons.remove, color: AppColors.signColor)),
                      SizedBox(
                        width: Dimensions.size5,
                      ),
                      BigText(text: controller.inCartItems.toString()),
                      SizedBox(
                        width: Dimensions.size5,
                      ),
                      GestureDetector(
                          onTap: () {
                            controller.setQuantity(true);
                          },
                          child: Icon(Icons.add, color: AppColors.signColor))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.size20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.size20),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(
                      text: "\$${product.price!} | Add to Cart",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
