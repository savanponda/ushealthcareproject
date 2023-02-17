import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState){

    on<Increment>((event, emit) => emit(CounterState(s1: state.s1 + event.value1)));
    on<Decrement>((event, emit) => emit(CounterState(s1:  state.s1>1?state.s1-event.value1:event.value1)));
  }


// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc(CounterState initialState) : super(initialState){
//     on<Increment>((event, emit) {
//         if (event == Increment) {
//            CounterState(s1: state.s1 + event.value1+1);
//         } else if (event == Decrement) {
//           CounterState(s1: state.s1 - 1);
//         }
//
//     });
//   }

  // Stream<CounterState> mapEventToState(CounterEvent event) async* {
  //
  //   if (event is Increment) {
  //     yield CounterState(
  //         s1: state.s1 + event.value1);
  //   } else if (event is Decrement) {
  //     yield CounterState(
  //         s1: state.s1 - event.value1,);
  //   }
  // }
}

