import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repositories/best_deals_books_repository.dart';
import 'package:bookly_app/features/shared/data/models/book_model.dart';
import 'package:meta/meta.dart';

part 'best_deals_books_state.dart';

class BestDealsBooksCubit extends Cubit<BestDealsBooksState> {
  final BestDealsBooksRepository bestDealsBooksRepository;
  BestDealsBooksCubit(this.bestDealsBooksRepository)
    : super(BestDealsBooksInitial());
  Future<void> fetchBestDealsBooks() async {
    emit(BestDealsBooksLoading());

    try {
      final books = await bestDealsBooksRepository.getBestDealsBooks();
      emit(BestDealsBooksSuccess(books));
    } catch (e) {
      emit(BestDealsBooksFailure(e.toString()));
    }
  }
}
