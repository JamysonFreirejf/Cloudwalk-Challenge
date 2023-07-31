import '../decodable/decodable.dart';

extension StringUnwrapping on Map {
  String? stringOf(String key) {
    return this[key];
  }
}

extension Doublenwrapping on Map {
  double? doubleOf(String key) {
    if (this[key] is int) {
      return (this[key] as int).toDouble();
    }
    return this[key];
  }
}

extension IntUnwrapping on Map {
  int? intOf(String key) {
    return this[key];
  }
}

extension BoolUnwrapping on Map {
  bool? boolOf(String key) {
    return this[key];
  }
}

extension ListOnMapUnwrapping on Map {
  List<T>? _listOf<T>({
    required String key,
    required DecodableProtocol decodable,
  }) {
    if (this[key] == null) {
      return null;
    }
    final List<dynamic> list = this[key];
    if (list.isEmpty) {
      return [];
    }
    if (list.first is Map<String, dynamic> == false) {
      return list.map((value) => value as T).toList();
    }

    final List<Map<String, dynamic>> listOf = list
        .map((dynamic object) => Map<String, dynamic>.from(object))
        .toList();
    return decodable.fromJsonList<T>(listOf);
  }
}

extension ListModelUnwrapping on Map {
  List<T>? listOf<T>(String key) {
    return ListOnMapUnwrapping(this)._listOf(
      key: key,
      decodable: Decodable.decode,
    );
  }
}

extension ObjectUnwrapping on Map {
  T? _objectOf<T>({
    required String key,
    required DecodableProtocol decodable,
  }) {
    if (this[key] == null) {
      return null;
    }
    final Map<String, dynamic> objectOf = Map<String, dynamic>.from(this[key]);
    return decodable.fromJson<T>(objectOf);
  }
}

extension ObjectModelUnwrapping on Map {
  T? objectOf<T>(String key) {
    return ObjectUnwrapping(this)._objectOf(
      key: key,
      decodable: Decodable.decode,
    );
  }
}

extension UnnamedObjectUnwrapping on Map {
  T? _objectOfThis<T>({
    DecodableProtocol? decodable,
  }) {
    final Map<String, dynamic> objectOf = Map<String, dynamic>.from(this);
    return decodable!.fromJson<T>(objectOf);
  }
}

extension UnnamedObjectModelUnwrapping on Map {
  T? objectOfThis<T>() {
    return UnnamedObjectUnwrapping(this)._objectOfThis(
      decodable: Decodable.decode,
    );
  }
}

extension UnnamedListUnwrapping on Map {
  List<T>? listOfThis<T>({
    DecodableProtocol? decodable,
  }) {
    final List<dynamic> list = this as List;
    final List<Map<String, dynamic>> listOf = list
        .map((dynamic object) => Map<String, dynamic>.from(object))
        .toList();
    return decodable?.fromJsonList<T>(listOf);
  }
}

extension UnnamedListModelUnwrapping on Map {
  List<T>? listOfThisModel<T>() {
    return UnnamedListUnwrapping(this).listOfThis(
      decodable: Decodable.decode,
    );
  }
}
