import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/food_body_screen.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/colos.dart';
import '../../utils/dimensions.dart';

class MainFoodpage extends StatefulWidget {
  const MainFoodpage({super.key});

  @override
  State<MainFoodpage> createState() => _MainFoodpageState();
}

class _MainFoodpageState extends State<MainFoodpage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    print('current height' + MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: 15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    BigText(
                      text: 'Nigeria',
                      color: AppColors.mainColor,
                      size: 30,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Abeokuta',
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ]),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          //showing the body
          Expanded(
              child: SingleChildScrollView(
            child: const FoodPageBody(),
          )),
        ],
      ),
      onRefresh: _loadResource,
    );
  }
}
