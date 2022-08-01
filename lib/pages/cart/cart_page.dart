import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';

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
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: 24,
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
        ],
      ),
    );
  }
}
