import 'package:flutter_bloc/flutter_bloc.dart';

enum RateAppStatus {
  initial,
  loading,
  success,
  error,
}

class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit() : super(const RateAppState());

  void selectRating(int rating) {
    emit(
      state.copyWith(
        rating: rating,
        status: RateAppStatus.initial,
      ),
    );
  }

  /* status: RateAppStatus.initial - для того, щоб після "eror" юзер міг
  обрати 1 - 5 зірочок й цим самим очистити eror-стан */

  void resetRating() {
    emit(state.copyWith(rating: 0, status: RateAppStatus.initial));
  }

  Future<void> submitRating() async {
    if (state.rating == 0) {
      emit(state.copyWith(status: RateAppStatus.error));
      return;
    }
    emit(state.copyWith(status: RateAppStatus.loading));
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: RateAppStatus.success));
  }

  void clearStatus() {
    emit(state.copyWith(status: RateAppStatus.initial));
  }

  /*Метод створений для можливості повторного натиснення кнопки "Submit",
  точніше - щоб при повторному натисненні на "Submit" при не обраній жодній
  із 5-ти зірочок юзер знову побачив снекбар. Щоб "кнопка не заїдала"*/
}

class RateAppState {
  const RateAppState({
    this.rating = 0,
    this.status = RateAppStatus.initial,
  });

  final int rating;
  final RateAppStatus status;

  RateAppState copyWith({
    int? rating,
    RateAppStatus? status,
  }) {
    return RateAppState(
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
  }
}
