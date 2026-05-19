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
    emit(state.copyWith(rating: rating));
  }

  void resetRating() {
    emit(state.copyWith(rating: 0, status: RateAppStatus.initial));
  }

  Future<void> submitRating() async {
    emit(state.copyWith(status: RateAppStatus.loading));
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: RateAppStatus.success));
  }
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
