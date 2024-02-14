import 'package:flutter/foundation.dart';
import 'package:ibaza_mock_data/features/category/data/model/category.dart';
import 'package:ibaza_mock_data/features/category/data/model/status.dart';
import 'package:ibaza_mock_data/features/category/data/repository/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _response;
  CategoryBloc({required CategoryRepository response})
      : _response = response,
        super(CategoryState(
          searchedCategory: [],
          isSearching: false,
          status: LoadingStatus.pure,
          categoryList: [],
        )) {
    on<LoadingCategory>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      try {
        List<CategoryModel> ls = await _response.getCategory();

        emit(
          state.copyWith(
            categoryList: ls,
            status: LoadingStatus.loadedWithSuccess,
          ),
        );
      } catch (e) {
        addError(e);
        print(e);
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });

    on<Searching>((event, emit) {
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false));
      } else {
        final newList = state.categoryList
            .where((element) => element.type.contains(event.query))
            .toList();
        emit(state.copyWith(searchedCategory: newList, isSearching: true));
      }
    });
  }
}
