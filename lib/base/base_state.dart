abstract class BaseState {}

class ErrorState extends BaseState {
  ErrorState(this.title, this.msg);

  final String title;
  final String msg;
}

class InitialState extends BaseState {}

class ProgressState extends BaseState {}

class ActionState extends BaseState {}
