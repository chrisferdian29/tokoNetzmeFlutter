import 'package:dio/dio.dart';
import 'package:toko_netzme/repository/retrofit/advance/advance_client.dart';

class AppRepository {

  AdvanceClient? _advanceApiRequest;
  Dio? dio;

  AppRepository() {
    dio = Dio();
    _advanceApiRequest = AdvanceClient(dio!);
  }
}