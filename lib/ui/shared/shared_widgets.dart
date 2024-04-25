import 'package:flutter/material.dart';
import 'package:shopping_app/ui/shared/models/app_bar_model.dart';
import 'package:shopping_app/ui/theme/TextStyles.dart';

class SharedWidgets {
  static PreferredSizeWidget buildAppBarTitleCenter(AppBarModel appBarModel) {
    return AppBar(
      title: Center(child: Text(appBarModel.title, style: TextsStyles.appBarTitle)),
      leading: appBarModel.iconDataLeading != null ? IconButton(
        icon: Icon(appBarModel.iconDataLeading),
        color: Colors.white,
        onPressed: () {
          appBarModel.onPressedLeading!();
        },
      ) : null,
      centerTitle: true,
      backgroundColor:
      Colors.indigo,
    );
  }
}