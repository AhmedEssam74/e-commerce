import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/theming/colors.dart';
import 'package:ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../../core/widgets/delete_item_background.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.image,
      required this.category,
      // required this.productName,
      required this.description,
      required this.price,
      required this.quantity,
      required this.onIncrementTap,
      required this.onDecrementTap, required this.onDismissed});
  final String image, category, /*productName, */ description, price;
  final int quantity;
  final VoidCallback onIncrementTap, onDecrementTap,onDismissed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
       onDismissed: (direction) {
        onDismissed();
      },
      direction: DismissDirection.endToStart,
      background: const DeleteItemBackground(),
      child: Container(
        height: 135,
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 0.6,
          ),
        ),
        child: Row(
          children: [
            _buildProductImage(),
            horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductDetails(),
                  _buildPriceAndQuantity(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: ColorsManager.mainGreen,
              ),
            ),
        errorWidget: (context, url, error) =>
        const Icon(HugeIcons.strokeRoundedImage02),
        height: double.infinity,
        width: 100,
        fit: BoxFit.cover,
      ),
      // child: Image.asset(
      //   image,
      //   width: 100,
      //   fit: BoxFit.cover,
      // ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: TextStyles.font12GreyRegular,
        ),
        // verticalSpace(5),
        // Text(
        //   productName,
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   style: TextStyles.font14BlackSemiBold,
        // ),
        verticalSpace(5),
        Text(
          description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font12BlackRegular,
        ),
      ],
    );
  }

  Widget _buildPriceAndQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$$price',
          style: TextStyles.font16BlackBold,
        ),
        _buildQuantityControl(),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      children: [
        _buildQuantityButton(
          icon: HugeIcons.strokeRoundedRemove01,
          color: ColorsManager.mainGreen,
          backgroundColor: ColorsManager.lightGreen,
          onTap: onDecrementTap,
        ),
        horizontalSpace(10),
        Text(
          quantity.toString(),
          style: TextStyles.font14BlackBold,
        ),
        horizontalSpace(10),
        _buildQuantityButton(
            icon: HugeIcons.strokeRoundedPlusSign,
            color: Colors.white,
            backgroundColor: ColorsManager.mainGreen,
            onTap: onIncrementTap),
      ],
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required Color color,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 17,
        backgroundColor: backgroundColor,
        child: HugeIcon(
          icon: icon,
          color: color,
          size: 17,
        ),
      ),
    );
  }
}
