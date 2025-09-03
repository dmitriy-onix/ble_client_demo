import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ble_client_demo/arch/bloc/base_cubit/sr_cubit_mixin.dart';
import 'package:ble_client_demo/arch/bloc/mixins/failure_stream_mixin.dart';
import 'package:ble_client_demo/arch/bloc/mixins/progress_stream_mixin.dart';

abstract class BaseCubit<State, SR> extends Cubit<State>
    with
        SingleResultCubitMixin<State, SR>,
        ProgressStreamMixin,
        FailureStreamMixin {
  BaseCubit(super.initialState);

  void dispose() {
    closeProgressStream();
    closeFailureStream();
  }
}