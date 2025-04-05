import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/main_appbar.dart';
import 'package:ecommerce/features/wishlist/ui/widgets/wishlist_gird_view.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Whislist'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              verticalSpace(10),
              const WishlistGirdView(),
            
            ],
          ),
        ),
      ),
    );
  }
}
