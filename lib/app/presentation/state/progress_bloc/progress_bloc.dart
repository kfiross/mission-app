import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState>{


  final StreamController<int> _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;
  late Timer _timer;
  final secLeft = 10;


  ProgressBloc() : super(ProgressScreenInitial());

  @override
  Stream<ProgressState> mapEventToState(
    ProgressEvent event,
  ) async* {
    if(event is LoadProgressEvent){

        _timer = Timer.periodic(const Duration(milliseconds: 5), (time) {
          var percent = time.tick / (10*1000 / 5)  *100;

          if(percent > 100) {
            _timer.cancel();
          } else{
            _counterController.add(percent.toInt());
          }
      });
    }
  }

  void dispose(){
    _timer.cancel();
    _counterController.close();
  }
}
