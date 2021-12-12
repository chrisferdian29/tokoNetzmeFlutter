import 'dart:async';

import 'package:toko_netzme/Helpers/api_response.dart';
import 'package:toko_netzme/view/Liveness/LivenessRepository.dart';

import 'auth_lisance.response.dart';

abstract class Bloc {
  void dispose();
}
class LivenessBloc implements Bloc{

  LivenessRepository livenessRepository = LivenessRepository();
  final _authLisanceController = StreamController<ApiResponse<AuthLisanceResponse>>();
  Stream<ApiResponse<AuthLisanceResponse>> get locationStream => _authLisanceController.stream;

  StreamSink<ApiResponse<AuthLisanceResponse>> get authSink =>
      _authLisanceController.sink;

  generateAuthLicense() async {
    authSink.add(ApiResponse.loading("Generate info"));

    try {
      AuthLisanceResponse authResponse = await livenessRepository.generateAuthLicense();
      authSink.add(ApiResponse.completed(authResponse));
    } catch (e) {
      authSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  @override
  void dispose() {
    _authLisanceController.close();
  }
}