import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:food_delivery/widgets/main_info_column.dart';

import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage("assets/image/food0.png"))),
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
                AppIcon(icon: Icons.arrow_back_ios),
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
                    text: "Chinese Side",
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
                          text:
                              "The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database"),
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
                text: "\$10 | Add to Cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
