import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: Dimensions.size20 * 3,
              left: Dimensions.size20w,
              right: Dimensions.size20w,
              child: Row(
                children: [
                  AppIcon(
                    icon: Icons.arrow_back,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: 24,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: 24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.size10w,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: 24,
                  ),
                ],
              ),
            ),
            Positioned(
              top: Dimensions.size100,
              left: Dimensions.size20w,
              right: Dimensions.size20w,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.size20),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartController) {
                      return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (_, index) {
                          final currentItem = cartController.getItems[index];
                          return Container(
                            height: Dimensions.size100,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(bottom: Dimensions.size10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(currentItem.product);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(
                                          RouteHelper.getPopularFoodDetail(
                                              popularIndex, "cartpage"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(currentItem.product);

                                      Get.toNamed(
                                          RouteHelper.getRecommendedFoodDetail(
                                              recommendedIndex, "cartpage"));
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.size100,
                                    height: Dimensions.size100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(Constants.BASE_URL +
                                            Constants.UPLOADS_URI +
                                            currentItem.img!),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.size20),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.size10w,
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.size100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: currentItem.name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: "\$ ${currentItem.price}",
                                              color: Colors.green,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(
                                                  Dimensions.size10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.size20),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                          currentItem.product!,
                                                          -1,
                                                        );
                                                      },
                                                      child: Icon(Icons.remove,
                                                          color: AppColors
                                                              .signColor)),
                                                  SizedBox(
                                                    width: Dimensions.size5,
                                                  ),
                                                  BigText(
                                                      text: currentItem.quantity
                                                          .toString()), //controller.inCartItems.toString()),
                                                  SizedBox(
                                                    width: Dimensions.size5,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                          currentItem.product!,
                                                          1,
                                                        );
                                                      },
                                                      child: Icon(Icons.add,
                                                          color: AppColors
                                                              .signColor))
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) {
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
                        SizedBox(
                          width: Dimensions.size5,
                        ),
                        BigText(
                            text:
                                '\$ ${cartController.totalAmount.toString()}'),
                        SizedBox(
                          width: Dimensions.size5,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.size20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.size20),
                        color: AppColors.mainColor,
                      ),
                      child: BigText(
                        text: "Proceed to checkout",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
