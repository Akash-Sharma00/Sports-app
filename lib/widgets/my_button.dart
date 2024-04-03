import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/pallate.dart';
import 'package:sports_app/util/global.dart';

class MyElevatedButton extends StatelessWidget {
  final Function() onTap;
  final String label;
  final bool active;
  const MyElevatedButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.active = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(173.w, 48.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          backgroundColor: active ? Pallate.appYellow : Pallate.appGrey),
      onPressed: onTap,
      child: Text(
        label,
        style: myTextStyle(color: active ? Colors.black : null),
      ),
    );
  }
}

class MyOutlineButton extends StatelessWidget {
  final Function() onTap;
  final String label;
  const MyOutlineButton({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(173.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4.r,
          ),
          side: BorderSide(width: 5, color: Pallate.appYellow),
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: myTextStyle(color: Pallate.appYellow),
      ),
    );
  }
}
