import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Connected, Lost }

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscribtion;
  InternetCubit() : super(InternetState.Initial) {
    connectivitySubscribtion =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.Connected);
      } else {
        emit(InternetState.Lost);
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscribtion?.cancel();
    return super.close();
  }
}
