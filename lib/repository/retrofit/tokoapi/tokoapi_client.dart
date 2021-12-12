import 'package:dio/dio.dart' hide Headers;import 'package:retrofit/http.dart';
import 'package:toko_netzme/Helpers/NetzColors.dart';
import 'package:toko_netzme/repository/model/auth_lisance.response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:toko_netzme/repository/model/tokoapi_facepay.response.dart';
import 'package:toko_netzme/repository/retrofit/tokoapi/tokoapi_apis.dart';
part 'tokoapi_client.g.dart';

@RestApi(baseUrl: NetzEnvi.baseUrlStg)
abstract class TokoapiClient {
  factory TokoapiClient(Dio dio) {
    return _TokoapiClient(dio, baseUrl: NetzEnvi.baseUrlStg);
  }

  @Headers(<String, String>{
    "Authorization": NetzEnvi.authentication
  })
  @POST(TokoapiApis.paymentFace)
  Future<TokoapiFacepayResponse> postPayFace(@Body() Map<String, dynamic> map);
}