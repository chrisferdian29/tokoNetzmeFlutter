import 'package:dio/dio.dart' hide Headers;import 'package:retrofit/http.dart';
import 'package:toko_netzme/repository/model/auth_lisance.response.dart';
import 'package:toko_netzme/repository/retrofit/advance/advance_apis.dart';
import 'package:retrofit/retrofit.dart';
part 'advance_client.g.dart';

@RestApi(baseUrl: "https://api.advance.ai/")
abstract class AdvanceClient {
  factory AdvanceClient(Dio dio) {
    return _AdvanceClient(dio, baseUrl: "https://api.advance.ai/");
}

  @Headers(<String, String>{
    "X-ADVAI-KEY": "3b92db82a081940a"
  })
  @POST(AdvanceApis.authLicense)
  Future<AuthLisanceResponse> getLicense(
      @Body() Map<String, dynamic> map
  );
}