import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repositories/free_books_repository.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:meta/meta.dart';

part 'free_books_state.dart';

class FreeBooksCubit extends Cubit<FreeBooksState> {
  final FreeBooksRepository freeBooksRepository;
  FreeBooksCubit(this.freeBooksRepository) : super(FreeBooksInitial());
  Future<void> fetchFreeBooks() async {
    emit(FreeBooksLoading());

    try {
      final books = await freeBooksRepository.getFreeBooks();
      emit(FreeBooksSuccess(books));
    } catch (e) {
      emit(FreeBooksFailure(e.toString()));
    }
  }
}
