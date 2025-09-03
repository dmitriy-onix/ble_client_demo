import 'dart:async';

import 'package:ble_client_demo/arch/domain/failure/failure.dart';

mixin class FailureStreamMixin {
  final StreamController<Failure> _errorStreamController =
      StreamController<Failure>.broadcast();

  Stream<Failure> get failureStream => _errorStreamController.stream;

  void onFailure(Failure failure) {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.add(failure);
    }
  }

  void closeFailureStream() {
    if (!_errorStreamController.isClosed) {
      _errorStreamController.close();
    }
  }
}
