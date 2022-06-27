import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:boycott_islamophobes/features/quote/domain/usecases/get_all_quotes_usecase.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/quote_entity.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final GetAllQuotesUsecase getQuotes;
  QuoteBloc({
    required this.getQuotes,
  }) : super(QuoteInitial()) {
    on<QuoteEvent>((event, emit) async {
      // get all quotes
      if (event is GetAllQuotesEvent) {
        emit(QuoteListLoading());
        var either = await getQuotes(NoParams());
        either.fold(
          (l) => emit(QuoteListError(message: l.toString())),
          (r) => emit(QuoteListLoaded(quotes: r)),
        );
      }
    });
  }
}
