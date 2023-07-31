typedef ObjectBuilder = Object Function();

typedef ObjectBuilderFactory = Map<Type, ObjectBuilder> Function(
  Map<String, dynamic>,
);
