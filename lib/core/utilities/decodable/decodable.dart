import 'package:flutter/foundation.dart';
import '../builder/model_builder_factory.dart';

abstract class DecodableProtocol {
  T fromJson<T>(Map<String, dynamic> json);

  List<T>? fromJsonList<T>(List<dynamic> jsonList);
}

mixin Decodable {
  static final _Decodable decode = _Decodable();
}

class _Decodable extends DecodableProtocol {
  @override
  T fromJson<T>(Map<String, dynamic> json) {
    final T converted = MixinModelFactory.buildObjects(json)[T]?.call() as T;

    if (converted != null) {
      return converted;
    } else {
      debugPrint('Failure parsing $T');
      throw Exception();
    }
  }

  @override
  List<T>? fromJsonList<T>(List jsonList) {
    return jsonList.map((dynamic json) => fromJson<T>(json)).toList();
  }
}
