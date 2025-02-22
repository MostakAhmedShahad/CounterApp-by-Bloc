 


class CounterState {

  final int counter;
  const CounterState({this.counter=0});

  CounterState copyWith ({int? counter}){

    return CounterState(counter: counter?? this.counter);
  }
}



 