import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.size45, bottom: Dimensions.size15),
              padding: EdgeInsets.symmetric(horizontal: Dimensions.size20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Kenya",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Nairobi",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.size45,
                      height: Dimensions.size45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.size24,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.size15),
                          color: AppColors.mainColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          )
        ],
      ),
    );
  }
}
