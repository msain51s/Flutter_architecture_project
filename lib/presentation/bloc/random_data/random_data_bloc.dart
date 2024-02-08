import 'package:cgi_test/domain/usecases/get_random_data.dart';
import 'package:cgi_test/presentation/bloc/random_data/random_data_event.dart';
import 'package:cgi_test/presentation/bloc/random_data/random_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomDataBloc extends Bloc<RandomDataEvent, RandomDataState> {
  final GetRandomData getRandomData;

  RandomDataBloc({required this.getRandomData}) : super(RandomDataInitial()) {
    on<FetchRandomData>((event, emit) async {
      emit(RandomDataLoading());
      final failureOnData = await getRandomData();
      failureOnData.fold((l) => emit(RandomDataError(failureOnData.toString())),
          (r) => emit(RandomDataLoaded(r)));
    });
  }
}
