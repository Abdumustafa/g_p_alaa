import 'package:g_p_alaa/core/helper/api.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/product_model.dart';

class GetAllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await ApiMethod().get(
      url: "https://fakestoreapi.com/products",
    );

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
