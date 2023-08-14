import 'package:myapp1/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
