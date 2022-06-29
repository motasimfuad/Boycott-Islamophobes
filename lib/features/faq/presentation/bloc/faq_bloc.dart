import 'package:bloc/bloc.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/faq/domain/usecases/get_all_faqs_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/faq_entity.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final GetAllFaqsUsecase getAllFaqs;
  FaqBloc({required this.getAllFaqs}) : super(FaqInitial()) {
    on<FaqEvent>((event, emit) async {
      if (event is GetAllFaqsEvent) {
        emit(FaqListLoading());
        var either = await getAllFaqs(NoParams());
        either.fold(
          (l) => emit(FaqListError(message: l.toString())),
          (r) => emit(FaqListLoaded(faqs: r)),
        );
      }
    });
  }
}
