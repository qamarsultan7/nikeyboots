import 'package:hive/hive.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';

class Boxes {
  static Box<CartModel> getCartData() => Hive.box<CartModel>('ShoesCart');
  static Box<FavItmsModel> getDagetFavData() => Hive.box<FavItmsModel>('Shoesfav');
}
