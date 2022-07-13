import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 75,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    text: "Chinese Side",
                    size: Dimensions.size26,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.size20),
                    topRight: Radius.circular(Dimensions.size20),
                  ),
                  color: Colors.white,
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.size20w, right: Dimensions.size20w),
                    child: ExpandableText(
                      text:
                          "The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database The @Insert annotation allows you to define methods that insert their parameters into the appropriate table in the database. The following code shows examples of valid @Insert methods that insert one or more User objects into the database",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.size20w * 2.5,
              right: Dimensions.size20w * 2.5,
              top: Dimensions.size10,
              bottom: Dimensions.size10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: 24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  icon: Icons.remove,
                ),
                BigText(
                  text: "\$18.88 " + " X " + " 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.size26,
                ),
                AppIcon(
                  iconSize: 24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  icon: Icons.add,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                    size: Dimensions.size24,
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
        ],
      ),
    );
  }
}
