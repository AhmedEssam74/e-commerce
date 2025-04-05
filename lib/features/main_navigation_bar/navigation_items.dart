import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce/features/profile/ui/screens/profile_screen.dart';
import 'package:ecommerce/features/wishlist/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../cart/ui/screens/cart_screen.dart';
import '../search/ui/search_screen.dart';

class NavigationItem {
  final String label;
  final IconData icon;
  final Widget page;

  NavigationItem({required this.label, required this.icon, required this.page});
}

final List<NavigationItem> navigationItems = [
  
  NavigationItem(
    label: 'Home',
    icon: HugeIcons.strokeRoundedHome01,
    page: const HomeScreen(),
  ),
  NavigationItem(
    label: 'Wishlist',
    icon: HugeIcons.strokeRoundedFavourite,
    page: const WishlistScreen(),
  ),
  NavigationItem(
    label: 'Search',
    icon: HugeIcons.strokeRoundedSearch01,
    page: const SearchScreen(),
  ),
  NavigationItem(
    label: 'Cart',
    icon: HugeIcons.strokeRoundedShoppingCart01,
    page: const CartScreen(),
  ),
  NavigationItem(
    label: 'Profile',
    icon: HugeIcons.strokeRoundedUser,
    page: const ProfileScreen(),
  ),
];
