import 'dart:convert';
import '../../utilities/decodable/decodable.dart';
import 'base_request.dart';
import 'package:dio/dio.dart';

mixin BaseService {
  Future<T> execute<T>(
    BaseHTTPRequest request,
    Dio provider,
  ) async {
    try {
      final String requestPath = _baseUrl + request.endpoint;
      Response<String>? response;
      var params = request.params;
      params.addAll({
        'appid': _appId,
      });
      response = await provider.get(
        requestPath,
        queryParameters: params,
      );
      final json = jsonDecode(response.data!) as Map<String, dynamic>;
      return Decodable.decode.fromJson<T>(json);
    } on DioError {
      rethrow;
    }
  }

  String get _baseUrl {
    return 'https://api.openweathermap.org/data/2.5/';
  }

  String get _appId {
    return '6f2afdd8f191c98a659eb40991af13fd';
  }
}
