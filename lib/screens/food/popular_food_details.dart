import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/screens/cart/cart_page.dart';
import 'package:food_delivery/screens/home/main_food_screen.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //backgroung Image
          Positioned(
            left: 0,
            right: 0,
            // child: CachedNetworkImage(
            //   imageUrl: AppConstants.BASE_URL +
            //       AppConstants.UPLOAD_URL +
            //       product.img!,
            //   imageBuilder: (context, imageProvider) => Container(
            //     width: 400,
            //     height: 200,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         fit: BoxFit.cover,
            //         image: imageProvider,
            //       ),
            //     ),
            //   ),
            //   placeholder: (context, url) => Container(
            //     alignment: Alignment.center,
            //     child: Text("Unable to load image"),
            //   ),
            //   errorWidget: (context, url, error) =>
            //       Image.asset("image/food1.png"),
            // ),
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URL +
                          AppConstants.UPLOAD_URL +
                          product.img!))),
            ),
          ),
          // Icon Widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
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
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.totalItems >= 1)
                        Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(children: [
                      AppIcon(
                        icon: Icons.shopping_cart_outlined,
                      ),
                      controller.totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: Colors.blue,
                              ),
                            )
                          : Container(),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 6,
                              top: 3,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                size: 12,
                                color: Colors.white,
                              ))
                          : Container(),
                    ]),
                  );
                })
              ],
            ),
          ),
          // Introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: product.name!,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: 'Introduce'),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  // Expandable Text Widget
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: product.description!),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: Dimensions.iconSize20,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                  BigText(
                    text: popularProduct.inCartItems.toString(),
                    color: Colors.black,
                    size: Dimensions.font20,
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: Dimensions.iconSize20,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: BigText(
                    text: '\$ ${product.price!} | Add to Cart',
                    color: Colors.white,
                    size: Dimensions.font20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius20,
                    ),
                    color: Colors.blue.shade300,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
