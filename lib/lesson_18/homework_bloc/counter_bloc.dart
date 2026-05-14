import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
    on<ResetEvent>(_reset);
  }

  void _increment(IncrementEvent event, Emitter<int> emit) {
    emit(state + 1);
  }

  void _decrement(DecrementEvent event, Emitter<int> emit) {
    emit(state - 1);
  }

  void _reset(ResetEvent event, Emitter<int> emit) {
    emit(0);
  }
}

class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class ResetEvent extends CounterEvent {}
