part of 'search_result_bloc.dart';

class SearchResultState extends Equatable {
  final List<SearchResultDetailModel> list;

  const SearchResultState({required this.list});

  @override
  List<Object> get props => [list];
}
