import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/api_service.dart';
import 'package:your_basket/models/category/category.dart';
import '../Services/api_service.dart';

final categoriesProvider = FutureProvider<List<Category>?>(
  (ref) {
    final apiRespository = ref.watch(apiService);

    return apiRespository.getCategory();
  },
);
