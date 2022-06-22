import 'package:bloc/bloc.dart';
import 'package:boycott_islamophobes/features/product/presentation/bloc/product_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductBloc productBloc;
  HomeBloc({
    required this.productBloc,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadHomePage) {
        // add(productBloc.getAllProducts);
        // productBloc.add(GetAllProductsEvent());
      }
    });
  }
}
