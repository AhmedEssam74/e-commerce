import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/widgets/secondary_appbar.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';

class AboutHeimScreen extends StatelessWidget {
  const AboutHeimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'About Heim'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10),
              const Text(
                  'Welcome to Heim – where style meets comfort! At Heim, we believe that furniture is more than just decor; it\'s a reflection of your personality, lifestyle, and comfort. Our mission is to make it easy for you to find beautiful, high-quality furniture that perfectly fits your space and taste.'),
              verticalSpace(15),
              Text(
                'Why Choose Heim?',
                style: TextStyles.font16BlackBold,
              ),
              verticalSpace(5),
              const Text(
                'Curated Collections – Explore a wide range of stylish and functional furniture for every room.Seamless Shopping – Browse, visualize, and purchase furniture effortlessly from your home.Augmented Reality (AR) – Preview furniture in your space before making a decision.Exclusive Deals – Enjoy special offers, seasonal discounts, and personalized recommendations. Fast & Reliable Delivery – Get your furniture delivered safely and on time.\n \n Whether you\'re furnishing a new home, upgrading your living space, or searching for unique accessories, Heim is your go-to destination for all things furniture.Transform your house into a home with Heim.Would you like any modifications to match Heim\'s branding?',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
