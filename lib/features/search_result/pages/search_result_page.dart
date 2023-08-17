import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_assessment/features/routes.dart';
import 'package:product_assessment/features/search_result/bloc/search_result_bloc.dart';
import 'package:product_assessment/features/search_result/models/search_result_models.dart';
import 'package:product_assessment/utils/utils.dart';

import '../../product_detail/models/product_detail_model.dart';

class SearchResultPage extends StatefulWidget {
  final String noResultDescription =
      "ไม่มีผลลัพธ์ในการค้นหา โปรดลองเปลี่ยนคำค้นหา และ ลองค้นหาใหม่อีกครั้ง";

  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPage();
}

class _SearchResultPage extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    final eventObject = ModalRoute.of(context)?.settings.arguments as SearchResultModels;
    BlocProvider.of<SearchResultBloc>(context).add(SearchProductByKeywordEvent(eventObject));

    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(eventObject.keyword),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: BlocBuilder<SearchResultBloc, SearchResultState>(
        builder: (context, state) {
          if (state.list.isEmpty) {
            return Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 60, right: 60),
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(Images.noResult),
                      ),
                    ),
                    Text(
                      widget.noResultDescription,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 140,
                ),
                padding: const EdgeInsets.only(bottom: 8),
                itemCount: state.list.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = state.list[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.productDetailPage,
                          arguments: ProductDetailModel(
                              imagePath: product.imagePath,
                              name: product.name,
                              price: product.price,
                              description: product.description));
                    },
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(product.imagePath),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
