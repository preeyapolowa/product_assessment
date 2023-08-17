import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:product_assessment/features/bottom_navigation_bars/1_home/bloc/home_page_bloc.dart';
import 'package:product_assessment/features/bottom_navigation_bars/5_profile/bloc/bloc/profile_bloc.dart';
import 'package:product_assessment/features/bottom_navigation_bars/bottom_bars_handler.dart';
import 'package:product_assessment/features/contact_info/bloc/contact_info_bloc.dart';
import 'package:product_assessment/features/routes.dart';
import 'package:product_assessment/features/search_result/bloc/search_result_bloc.dart';
import 'package:product_assessment/utils/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final homePageBloc = BlocProvider<HomePageBloc>(create: (context) => HomePageBloc());
    final searchResultPageBloc =
        BlocProvider<SearchResultBloc>(create: (context) => SearchResultBloc());
    final profilePageBloc = BlocProvider<ProfileBloc>(create: (context) => ProfileBloc());
    final contactInfoPageBloc =
        BlocProvider<ContactInfoBloc>(create: (context) => ContactInfoBloc());

    return MultiBlocProvider(
      providers: [homePageBloc, searchResultPageBloc, profilePageBloc, contactInfoPageBloc],
      child: MaterialApp(
        title: 'Product Assessment',
        routes: AppRoute().getAll,
        builder: EasyLoading.init(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
            fontFamily: 'Graphik'),
        home: const BottomBarsHandler(),
      ),
    );
  }
}
