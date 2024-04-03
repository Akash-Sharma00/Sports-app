import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/pallate.dart';
import 'package:sports_app/util/all_constants.dart';
import 'package:sports_app/util/global.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? child;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final double height;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.actions,
      this.child,
      this.bottom,
      this.height = 56,
      this.toolbarHeight});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      toolbarHeight: toolbarHeight ?? toolbarHeight,
      title: child ??
          Text(
            title,
            style: myTextStyle(),
          ),
      actions: actions ??
          [
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Image.asset(AssetConst.help)))
          ],
      leading: GestureDetector(child: Image.asset(AssetConst.back)),
      backgroundColor: backgroundColor ?? Pallate.appBarBg,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
