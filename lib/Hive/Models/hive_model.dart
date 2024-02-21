import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int price;
  @HiveField(3)
  String size;
  @HiveField(4)
  int count;
  @HiveField(5)
  String img;
  @HiveField(6)
  int initialprice;
  CartModel(
      {
      required this.id,
      required this.title,
      required this.price,
      required this.initialprice,
      required this.size,
      required this.img,
      required this.count});
}


@HiveType(typeId: 1)
class FavItmsModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String img;
  @HiveField(2)
  int price;
  @HiveField(3)
  int id;
  FavItmsModel({required this.title, required this.price, required this.img,required this.id});
}