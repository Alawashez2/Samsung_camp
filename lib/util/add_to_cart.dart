import 'package:samsung_camp/data/global_data.dart';
import 'package:samsung_camp/data/model/product.dart';

int allQuantity = 0;
double totalPrice = 0;
addToCart({required Product product, required int quantity}) {
  allQuantity += product.quantity!;
  totalPrice += product.quantity! * product.price!;
  for (var element in shoppingList) {
    if (element.productName == product.productName) {
      element.quantity = element.quantity! + quantity;
      return;
    }
  }
  shoppingList.add(product);
}
