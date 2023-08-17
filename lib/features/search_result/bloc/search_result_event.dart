part of 'search_result_bloc.dart';

@immutable
sealed class SearchResultEvent extends Equatable {
  const SearchResultEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SearchProductByKeywordEvent extends SearchResultEvent {
  SearchResultModels model;

  SearchProductByKeywordEvent(this.model);
}
