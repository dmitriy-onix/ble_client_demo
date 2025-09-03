/// To add custom progress data in progress management - extends from [BaseProgressState]
sealed class BaseProgressState {
  const BaseProgressState();
}

class DefaultProgressState extends BaseProgressState {
  final bool showProgress;

  const DefaultProgressState({required this.showProgress});
}