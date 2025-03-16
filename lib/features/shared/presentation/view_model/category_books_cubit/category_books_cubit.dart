import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:bookly_app/features/shared/data/repositories/category_books_repository.dart';
import 'package:meta/meta.dart';

part 'category_books_state.dart';

class CategoryBooksCubit extends Cubit<CategoryBooksState> {
  final CategoryBooksRepository categoryBooksRepository;
  CategoryBooksCubit(this.categoryBooksRepository)
    : super(CategoryBooksInitial());

  Future<void> fetchBestDealsBooks({required String category}) async {
    emit(CategoryBooksLoading());

    try {
      final books = await categoryBooksRepository.getBooksByCategory(
        category: category,
      );
      emit(CategoryBooksSuccess(books));
    } catch (e) {
      emit(CategoryBooksFailure(e.toString()));
    }
  }
}
