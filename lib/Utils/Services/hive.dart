import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikeyboots/Bloc/Bill%20Counter/billcounter_bloc.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';
import 'package:nikeyboots/Hive/boxes.dart';
import 'package:nikeyboots/Resources/constants.dart';
import 'package:nikeyboots/Utils/utils.dart';

class Services {
  final BuildContext context;
  Services({required this.context});
  void addToCart(CartModel modl) {
    final box = Boxes.getCartData();
    bool check = box.values.any((element) => element.id == modl.id);
    if (check) {
      Utils.showToastMessage('Already Added', Colors.red, context);
    } else {
      box.add(modl).then((value) {
        Utils.showToastMessage('Added To Cart', KCONTANTBLUECOLOR, context);
        context.read<BillcounterBloc>().add(BillCount());
      });
    }
  }

  void updateCart(List<CartModel> modl, index, double price, int count) {
    modl[index].count = count;
    modl[index].price = price.toInt();
    modl[index].save().then((value) {
      context.read<BillcounterBloc>().add(BillCount());
    });
  }

  void deleteItem(
    CartModel cartModel,
  ) {
    cartModel.delete().then((value) {
      Utils.showToastMessage(
          'Item Removed From Cart', KCONTANTBLUECOLOR, context);
      context.read<BillcounterBloc>().add(BillCount());
    });
  }

  void addToFav(FavItmsModel modl) {
    final box = Boxes.getDagetFavData();
    bool check = box.values.any((element) => element.id == modl.id);
    if (check) {
      Utils.showToastMessage('Already Added', Colors.red, context);
    } else {
      box.add(modl).then((value) {
        Utils.showToastMessage('Item Added to Fav', KCONTANTBLUECOLOR, context);
      });
    }
  }
}
