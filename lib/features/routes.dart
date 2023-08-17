import 'package:flutter/material.dart';
import 'package:product_assessment/features/bottom_navigation_bars/1_home/pages/home_page.dart';
import 'package:product_assessment/features/contact_info/pages/contact_info.dart';
import 'package:product_assessment/features/product_detail/pages/product_detail_page.dart';
import 'package:product_assessment/features/search_result/pages/search_result_page.dart';

class AppRoute {
  static const homePage = 'home';
  static const productDetailPage = 'product_detail';
  static const searchResultPage = 'search_result';
  static const contactInfoPage = 'contact_info';

  final _route = <String, WidgetBuilder>{
    homePage: (context) => const HomePage(),
    productDetailPage: (context) => const ProductDetailPage(),
    searchResultPage: (context) => const SearchResultPage(),
    contactInfoPage: (context) => const ContactInfoPage(),
  };

  get getAll => _route;
}
