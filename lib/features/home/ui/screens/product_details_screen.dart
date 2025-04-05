import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/secondary_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/product_details/product_details_info_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Product Details'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(10),
            const ProductDetailsInfoSection(),
          ],
        ),
      ),
    );
  }
}
