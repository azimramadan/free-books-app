import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repositories/latest_books_repository.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:meta/meta.dart';

part 'latest_books_state.dart';

class LatestBooksCubit extends Cubit<LatestBooksState> {
  final LatestBooksRepository latestBooksRepository;
  LatestBooksCubit(this.latestBooksRepository) : super(LatestBooksInitial());
  Future<void> fetchLatestBooks() async {
    emit(LatestBooksLoading());

    try {
      final books = await latestBooksRepository.getLatestBooks();
      emit(LatestBooksSuccess(books));
    } catch (e) {
      emit(LatestBooksFailure(e.toString()));
    }
  }
}
