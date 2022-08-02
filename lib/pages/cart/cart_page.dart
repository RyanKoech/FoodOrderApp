import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
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
                    Get.to(() => MainFoodPage());
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
                              Container(
                                width: Dimensions.size100,
                                height: Dimensions.size100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(Constants.BASE_URL +
                                        Constants.UPLOADS_URI +
                                        currentItem.img!),
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.size20),
                                  color: Colors.white,
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
                                                      // controller.setQuantity(false);
                                                    },
                                                    child: Icon(Icons.remove,
                                                        color: AppColors
                                                            .signColor)),
                                                SizedBox(
                                                  width: Dimensions.size5,
                                                ),
                                                BigText(
                                                    text:
                                                        "0"), //controller.inCartItems.toString()),
                                                SizedBox(
                                                  width: Dimensions.size5,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      // controller.setQuantity(true);
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
    );
  }
}
