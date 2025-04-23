
import 'package:g_p_alaa/core/helper/api.dart';

class AllCategoryService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await ApiMethod().get(
      url: 'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}
