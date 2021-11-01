// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'advance_client.dart';

class _AdvanceClient implements AdvanceClient {
  _AdvanceClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.advance.ai/';
  }

  late final Dio _dio;

  late String? baseUrl = _dio.options.baseUrl;

  @override
  Future<AuthLisanceResponse> getLicense(Map<String, dynamic> map) async {

    final _headers = <String, dynamic>{
      "X-ADVAI-KEY": "3b92db82a081940a"
    };
    final _data = <String, dynamic>{};
    _dio.options.baseUrl = baseUrl!;
    final _result = await _dio.request<Map<String, dynamic>>(AdvanceApis.authLicense,
        queryParameters: map,
        options: Options(
            method: 'POST',
            headers: _headers,
            extra: _dio.options.extra,
        ),
        data: _data);
    print(_result);
    final value = AuthLisanceResponse.fromJson(_result.data!);
    return value;
  }
}