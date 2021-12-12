// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'tokoapi_client.dart';

class _TokoapiClient implements TokoapiClient {
  _TokoapiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= NetzEnvi.baseUrlStg;
  }

  late final Dio _dio;

  late String? baseUrl = _dio.options.baseUrl;
  final _headers = <String, dynamic>{
    "Authorization": NetzEnvi.authentication
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
    print(_result.statusCode);
    print(_result);

    final value = TokoapiFacepayResponse.fromJson(_result.data!);
    return value;
  }
}