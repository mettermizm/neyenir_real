part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => [];
}

class OnVisiblityChange extends ApplicationEvent {
  const OnVisiblityChange(this.status);

  final bool status;
}
