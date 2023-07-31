import '../../services/base/response_model_builder.dart';
import 'object_builder_factory.dart';

mixin MixinModelFactory {
  static ObjectBuilderFactory buildObjects = (Map<String, dynamic> json) =>
      <Type, ObjectBuilder>{}..addAll(BuilderFactory.buildObjects(json));
}
