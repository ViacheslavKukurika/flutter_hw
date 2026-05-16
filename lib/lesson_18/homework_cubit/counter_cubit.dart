import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    final updatedState = state + 1;
    emit(updatedState);
  }

  void decrement() {
    final updatedState = state - 1;
    emit(updatedState);
  }

  void reset() {
    final updatedState = 0;
    emit(updatedState);
  }
}
