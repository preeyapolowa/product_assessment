import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:product_assessment/features/search_result/models/search_result_models.dart';
import 'package:product_assessment/mock_datas/product_mock.dart';

part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc() : super(const SearchResultState(list: [])) {
    on<SearchProductByKeywordEvent>((event, emit) {
      final productList = ProductMock.products;
      final keyword = event.model.keyword;
      final searchResult =
          productList.where((item) => item['keyword'].toString().contains(keyword)).toList();
      final listModels =
          searchResult.map((item) => SearchResultDetailModel.fromJson(item)).toList();
      emit(SearchResultState(list: listModels));
      for (var element in listModels) {
        debugPrint(element.name);
        debugPrint(element.description);
        debugPrint("${element.price}");
      }
    });
  }
}
