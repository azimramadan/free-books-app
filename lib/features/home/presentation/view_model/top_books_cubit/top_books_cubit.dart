import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repositories/top_books_repository.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:meta/meta.dart';

part 'top_books_state.dart';

class TopBooksCubit extends Cubit<TopBooksState> {
  final TopBooksRepository topBooksRepository;
  TopBooksCubit(this.topBooksRepository) : super(TopBooksInitial());

  Future<void> fetchTopBooks() async {
    emit(TopBooksLoading());

    try {
      final books = await topBooksRepository.fetchTopBooks();
      emit(TopBooksSuccess(books));
    } catch (e) {
      emit(TopBooksFailure(e.toString()));
    }
  }
}
