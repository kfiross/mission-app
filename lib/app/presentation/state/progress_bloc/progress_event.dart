part of 'progress_bloc.dart';

abstract class ProgressEvent extends Equatable {
  const ProgressEvent();
}

class LoadProgressEvent extends ProgressEvent{
  @override
  List<Object?> get props => [];

}
