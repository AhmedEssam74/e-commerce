import 'package:ecommerce/core/routing/route_helpers.dart';
import 'package:ecommerce/core/routing/routes.dart';
import 'package:ecommerce/features/Auth/login/ui/screens/forgot_password_screen.dart';
import 'package:ecommerce/features/Auth/login/ui/screens/login_screen.dart';
import 'package:ecommerce/features/Auth/otp/ui/otp_screen.dart';
import 'package:ecommerce/features/cart/ui/screens/payment_success_screen.dart';
import 'package:ecommerce/features/home/ui/screens/categories_screen.dart';
import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce/features/home/ui/screens/notifications_screen.dart';
import 'package:ecommerce/features/home/ui/screens/product_details_screen.dart';
import 'package:ecommerce/features/profile/ui/screens/about_heim_screen.dart';
import 'package:ecommerce/features/profile/ui/screens/orders_screen.dart';
import 'package:ecommerce/features/profile/ui/screens/privacy_policy_screen.dart';
import 'package:ecommerce/features/profile/ui/screens/track_order_screen.dart';
import 'package:ecommerce/features/profile/ui/screens/vouchers_screen.dart';
import 'package:flutter/material.dart';
import '../../features/cart/ui/screens/checkout_screen.dart';
import '../../features/main_navigation_bar/main_navigation_bar.dart';
import '../../features/onBoarding/ui/on_boarding_screen.dart';
import '../../features/profile/ui/screens/saved_addresses_screen.dart';

class AppRouter {
  Route? generteRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return buildRoute(const OnBoardingScreen());
      case Routes.loginScreen:
        return buildRoute(const LoginScreen());
      case Routes.forgotPasswordScreen:
        return buildRoute(const ForgotPasswordScreen());
      case Routes.otpScreen:
        return buildRoute(const OtpScreen());
      case Routes.mainNavigationBar:
        final int selectedIndex = settings.arguments as int? ?? 0;
        return buildRoute(MainNavigationBar(selectedIndex: selectedIndex));
      case Routes.categoriesScreen:
        return buildRoute(const CategoriesScreen());
      case Routes.homeScreen:
        return buildRoute(const HomeScreen());
      case Routes.notificationsScreen:
        return buildRoute(const NotificationsScreen());
      case Routes.productDetailsScreen:
        return buildRoute(const ProductDetailsScreen());
      case Routes.checkoutScreen:
        return buildRoute(const CheckoutScreen());
      case Routes.paymentSuccessScreen:
        return buildRoute(const PaymentSuccessScreen());
      case Routes.vouchersScreen:
        return buildRoute(const VouchersScreen());
      case Routes.savedAddressesScreen:
        return buildRoute(const SavedAddressesScreen());
      case Routes.privacyPolicyScreen:
        return buildRoute(PrivacyPolicyScreen());
      case Routes.aboutHeimScreen:
        return buildRoute(const AboutHeimScreen());
      case Routes.ordersScreen:
        return buildRoute(const OrdersScreen());
      case Routes.trackOrderScreen:
        return buildRoute(const TrackOrderScreen());
      default:
        return null;
    }
  }
}
