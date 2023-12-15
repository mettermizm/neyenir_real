import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial()) {
    on<OnVisiblityChange>((event, emit) {
      emit(const ApplicationButtonHide());

      if (event.status) {
        emit(const ApplicationButtonShow());
      } else {
        emit(const ApplicationButtonHide());
      }
    });
  }
}
