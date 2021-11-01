import 'package:dio/dio.dart' hide Headers;import 'package:retrofit/http.dart';
import 'package:toko_netzme/repository/model/auth_lisance.response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:toko_netzme/repository/model/tokoapi_facepay.response.dart';
import 'package:toko_netzme/repository/retrofit/tokoapi/tokoapi_apis.dart';
part 'tokoapi_client.g.dart';

//DEV
//https://tokoapi-dev.netzme.com/
//STG
//https://tokoapi-stg.netzme.com/
//PROD
//https://tokoapi.netzme.com/

@RestApi(baseUrl: "https://tokoapi-stg.netzme.com/")
abstract class TokoapiClient {
  factory TokoapiClient(Dio dio) {
    return _TokoapiClient(dio, baseUrl: "https://tokoapi-stg.netzme.com/");
  }

  @Headers(<String, String>{
    //DEV
    // "Authorization": "Basic TV9jekJTQ0RWWTozZGRhZjVmM2ViZmJkYWE1NzAxZjBlYWZjYTYyMjAzNg=="
    //STG
    "Authorization": "Basic TV9LZTl4cWxzSzpMckdiOG5Bb0tD"
    //PROD
    // "Authorization": "Basic TV9jekJTQ0RWWTozZGRhZjVmM2ViZmJkYWE1NzAxZjBlYWZjYTYyMjAzNg=="
  })
  @POST(TokoapiApis.paymentFace)
  Future<TokoapiFacepayResponse> postPayFace(@Body() Map<String, dynamic> map);
}