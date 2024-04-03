import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/models/leader_model.dart';
import 'package:sports_app/pallate.dart';
import 'package:sports_app/util/global.dart';

import '../widgets/my_app_bar.dart';

class LeaderBoard extends StatelessWidget {
  final List<LeaderModel> model;
  const LeaderBoard({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallate.previewBg,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        title: "",
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Text(
              "Ind Vs Aus",
              style: myTextStyle(color: Pallate.previewtext),
            ),
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: myTextStyle(),
            ),
            RichText(
              text: TextSpan(
                text: '2000 Pts ',
                style: myTextStyle(fontSize: 14.sp, color: Pallate.previewtext),
                children: [
                  TextSpan(
                    text: '16 Positions',
                    style:
                        myTextStyle(fontSize: 14.sp, color: Pallate.appYellow),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Pallate.selectionCardColor),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: Pallate.header,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Predication/Score",
                    style: myTextStyle(fontSize: 12.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.w),
                    child: Text(
                      "Point",
                      style: myTextStyle(fontSize: 12.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 34.w, right: 27.w),
                    child: Text(
                      "Rank",
                      style: myTextStyle(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < model.length; i++)
                      statsRow(
                          index: "${i + 1}",
                          title: model[i].title,
                          value: model[i].val,
                          toatlValue: "300"),
                    // statsRow(
                    //     index: "2",
                    //     title: "H.I.S",
                    //     value: "10",
                    //     toatlValue: "10"),
                    // statsRow(
                    //     index: "3",
                    //     title: "1's",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "4",
                    //     title: "2's",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "5",
                    //     title: "4's",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "6",
                    //     title: "Wickets",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "7",
                    //     title: "Caught",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "8",
                    //     title: "LBW",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "9",
                    //     title: "Bowled",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "10",
                    //     title: "Extra",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "11",
                    //     title: "Wide",
                    //     value: "200",
                    //     toatlValue: "300"),
                    // statsRow(
                    //     index: "12",
                    //     title: "Leg Bye",
                    //     value: "200",
                    //     toatlValue: "300"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding statsRow({
    required String index,
    required String title,
    required String value,
    required String toatlValue,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, bottom: 25.h, left: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "$index.",
            style: myTextStyle(fontSize: 14.sp, color: Pallate.appGrey),
          ),
          SizedBox(
            width: 90.w,
            child: Text(
              " $title",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: myTextStyle(fontSize: 14.sp),
            ),
          ),
          const Spacer(),
          Container(
            height: 29.h,
            width: 84.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Pallate.textfiledBg.withOpacity(.4),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: RichText(
              text: TextSpan(
                text: value.isEmpty ? "0/" : '$value/',
                style: myTextStyle(fontSize: 14.sp, color: Pallate.previewtext),
                children: [
                  TextSpan(
                    text: '0',
                    style:
                        myTextStyle(fontSize: 14.sp, color: Pallate.appYellow),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Container(
              height: 29.h,
              width: 52.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Pallate.textfiledBg.withOpacity(.4),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                "0",
                style: myTextStyle(color: Pallate.appYellow),
              )),
          SizedBox(
            width: 11.w,
          ),
          Container(
            height: 29.h,
            width: 56.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Pallate.textfiledBg.withOpacity(.4),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              "0",
              style: myTextStyle(color: Pallate.appYellow),
            ),
          ),
        ],
      ),
    );
  }
}
