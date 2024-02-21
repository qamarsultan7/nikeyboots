// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';
import 'package:nikeyboots/Hive/boxes.dart';
import 'package:nikeyboots/Resources/Widgets/items_grid.dart';
import 'package:nikeyboots/Resources/constants.dart';

class FavItemsView extends StatefulWidget {
  final BoxConstraints size;
  const FavItemsView({Key? key, required this.size}) : super(key: key);

  @override
  _FavItemsViewState createState() => _FavItemsViewState();
}

class _FavItemsViewState extends State<FavItemsView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<FavItmsModel>>(
        valueListenable: Boxes.getDagetFavData().listenable(),
        builder: (_, box, __) {
          if (box.isNotEmpty) {
            return Padding(
              padding: KCONSTANTPADDING,
              child: GridView.builder(
                  itemCount: box.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.82,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var data = box.values.toList().cast<FavItmsModel>();
                    return ItemsGrid(
                      size: widget.size,
                      data: data,
                      index: index,
                    );
                  }),
            );
          } else if (box.isEmpty) {
            return const Center(
              child: Text('No Fav Items '),
            );
          } else {
            return const Center(
              child: Text('SomeThing Went Wrong '),
            );
          }
        });
  }
}
