import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/models/score_model.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreModel> {
  ScoreBloc()
      : super(
          ScoreModel(
            r0: [],
            w0: [],
            e0: [],
            r1: [],
            w3: [],
            e2: [],
            slections: 0,
            r2: [],
          ),
        ) {
    on<Update>((event, emit) {
      ScoreModel model = event.model;

      emit(model);
    });
  }
}
