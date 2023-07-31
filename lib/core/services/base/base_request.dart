abstract class BaseHTTPRequest {
  String get endpoint;
  Map<String, dynamic> get params;
}

class BaseRequest implements BaseHTTPRequest {
  @override
  String get endpoint => '';

  @override
  Map<String, dynamic> get params => <String, dynamic>{};
}
