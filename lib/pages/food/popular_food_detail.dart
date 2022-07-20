import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/model/popular_products_model.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
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
  int pageId;
  PopularFoodDetail({
    required this.pageId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId];
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
                    Get.back();
                  },
                  child: AppIcon(icon: Icons.arrow_back),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
      bottomNavigationBar: Container(
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
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(
                    width: Dimensions.size5,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.size5,
                  ),
                  Icon(Icons.add, color: AppColors.signColor)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.size20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.size20),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: "\$${product.price!} | Add to Cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
