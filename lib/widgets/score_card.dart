import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/bloc/score_bloc.dart';
import 'package:sports_app/models/score_model.dart';
import 'package:sports_app/pallate.dart';
import 'package:sports_app/util/all_constants.dart';
import 'package:sports_app/util/global.dart';
import 'dart:math' as math;

class ScoreCard extends StatelessWidget {
  final Function()? onClear;
  const ScoreCard({super.key, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Pallate.appBarBg,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetConst.ausFlag),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AUS",
                    style: myTextStyle(color: Pallate.appGrey, fontSize: 12.sp),
                  ),
                  Text(
                    "0",
                    style: myTextStyle(
                        color: Pallate.appBarTitle, fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(
                width: 36.w,
              ),
              Text(
                "India won the toss and\nelected to bat first",
                textAlign: TextAlign.center,
                style: myTextStyle(color: Pallate.appYellow, fontSize: 12.sp),
              ),
              SizedBox(
                width: 36.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "IND",
                    style: myTextStyle(color: Pallate.appGrey, fontSize: 12.sp),
                  ),
                  Text(
                    "0",
                    style: myTextStyle(
                        color: Pallate.appBarTitle, fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Image.asset(AssetConst.indFlag)
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<ScoreBloc, ScoreModel>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Selection\n',
                      style:
                          myTextStyle(fontSize: 10.sp, color: Pallate.appGrey),
                      children: [
                        TextSpan(
                          text: state.slections.toString(),
                          style: myTextStyle(fontSize: 16.sp),
                        ),
                        const TextSpan(
                          text: '/12',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  for (int i = 0; i < 12; i++)
                    Transform.rotate(
                      angle: 4 * math.pi / 180,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        height: 27.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: state.slections > i
                              ? Pallate.selectionCardColor
                              : Pallate.appGrey,
                          borderRadius: BorderRadius.circular(1.r),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 12.w,
                  ),
                  GestureDetector(
                      onTap: onClear, child: Image.asset(AssetConst.minus))
                ],
              );
            },
          ),
          SizedBox(
            height: 17.h,
          ),
        ],
      ),
    );
  }
}
