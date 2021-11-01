// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'tokoapi_client.dart';

class _TokoapiClient implements TokoapiClient {
  _TokoapiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://tokoapi-stg.netzme.com/';
  }

  late final Dio _dio;

  late String? baseUrl = _dio.options.baseUrl;
  final _headers = <String, dynamic>{
    //DEV
    // "Authorization": "Basic TV9jekJTQ0RWWTozZGRhZjVmM2ViZmJkYWE1NzAxZjBlYWZjYTYyMjAzNg=="
    //STG
    "Authorization": "Basic TV9LZTl4cWxzSzpMckdiOG5Bb0tD"
    //PROD
    // "Authorization": "Basic TV9jekJTQ0RWWTozZGRhZjVmM2ViZmJkYWE1NzAxZjBlYWZjYTYyMjAzNg=="
  };

  @override
  Future<TokoapiFacepayResponse> postPayFace(Map<String, dynamic> map) async {

    final _data = <String, dynamic>{};
    _dio.options.baseUrl = baseUrl!;
    final _result = await _dio.post<Map<String, dynamic>>(TokoapiApis.paymentFace,
        queryParameters: null,
        options: Options(
          method: 'POST',
          headers: _headers,
          extra: _dio.options.extra,
        ),
        data: map);
    print(_dio.options);
    print(_result.data);

    final value = TokoapiFacepayResponse.fromJson(_result.data!);
    return value;
  }
}