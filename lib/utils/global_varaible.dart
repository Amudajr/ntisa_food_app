import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ntisa_food_app/provider/product_provider.dart';

final productProvider = ChangeNotifierProvider<ProductsProvider>((ref) {
  return ProductsProvider();
});
