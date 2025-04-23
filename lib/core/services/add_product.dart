

import 'package:g_p_alaa/core/helper/api.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map <String,dynamic> data = await ApiMethod().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category, 
      },
    );
    
    return ProductModel.fromJson(data);

    
  }
}
 