import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:sports_app/bloc/score_bloc.dart';
import 'package:sports_app/models/score_model.dart';
import 'package:sports_app/pallate.dart';
import 'package:sports_app/util/all_constants.dart';
import 'package:sports_app/util/global.dart';

class DataCard extends StatelessWidget {
  final List<String> fields;
  final bool isMendatory;
  final bool last;
  final int max;
  final String id;
  final String label;
  final List<TextEditingController> textControllers;
  const DataCard(
      {super.key,
      required this.fields,
      this.isMendatory = false,
      required this.label,
      this.last = false,
      required this.textControllers,
      required this.max,
      required this.id});

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.circular(8.r),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: myTextStyle(),
              ),
              if (!isMendatory)
                JustTheTooltip(
                  preferredDirection: AxisDirection.right,
                  backgroundColor: Pallate.appBarBg,
                  content: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 9.h, horizontal: 12.w),
                    child: Text(
                      "You can only predict any $max",
                      style: myTextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Image.asset(AssetConst.info),
                  ),
                )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          for (int i = 0; i < fields.length; i++)
            BlocBuilder<ScoreBloc, ScoreModel>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => updateSelection(i, id, state, context),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    margin: EdgeInsets.only(bottom: 15.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isMendatory || getSelection(i, id, state)
                          ? Pallate.selectionCardColor.withOpacity(.4)
                          : null,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              fields[i],
                              style: myTextStyle(
                                  fontSize: 14.sp, color: Pallate.appGrey),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 110.w,
                              height: 34.h,
                              child: TextField(
                                onChanged: (value) => isMendatory
                                    ? updateMendate(i, id, textControllers[i],
                                        context, state)
                                    : null,
                                controller: textControllers[i],
                                enabled:
                                    getSelection(i, id, state) || isMendatory,
                                style: myTextStyle(fontSize: 16.sp),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "-",
                                    hintStyle: myTextStyle(),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 7.w),
                                    focusedBorder: outlineInputBorder,
                                    border: outlineInputBorder,
                                    filled: true,
                                    fillColor: Pallate.textfiledBg),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            if (isMendatory)
                              Container(
                                height: 24.w,
                                width: 24.w,
                                decoration: BoxDecoration(
                                  color: Pallate.selectionCardColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                            if (!isMendatory)
                              Visibility(
                                visible: !getSelection(i, id, state),
                                replacement: GestureDetector(
                                  onTap: () => icrease(textControllers[i]),
                                  child: Image.asset(AssetConst.plus),
                                ),
                                child: Image.asset(AssetConst.minus),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          if (!last)
            Divider(
              color: Pallate.appGrey.withOpacity(0.2),
            )
        ],
      ),
    );
  }

  bool getSelection(int i, String id, ScoreModel model) {
    switch (id) {
      case "r1":
        return model.r1.contains(i);
      case "r2":
        return model.r2.contains(i);
      case "w3":
        return model.w3.contains(i);
      case "e2":
        return model.e2.contains(i);

      default:
    }
    return false;
  }

  void updateSelection(
      int i, String id, ScoreModel model, BuildContext context) {
    switch (id) {
      case "r1":
        if (model.r1.contains(i)) {
          model.r1.remove(i);
          break;
        }
        model.r1 = [i];
        break;
      case "r2":
        if (model.r2.contains(i)) {
          model.r2.remove(i);
          break;
        } else {
          if (model.r2.length >= 2) {
            int index = model.r2.removeLast();
            textControllers[index].text = '';
            model.r2.add(i);
          } else {
            model.r2.add(i);
          }
          break;
        }
      case "w3":
        if (model.w3.contains(i)) {
          model.w3.remove(i);
          break;
        } else {
          if (model.w3.length >= 3) {
            int index = model.w3.removeLast();
            textControllers[index].text = '';
            model.w3.add(i);
          } else {
            model.w3.add(i);
          }
          break;
        }
      case "e2":
        if (model.e2.contains(i)) {
          model.e2.remove(i);
          break;
        } else {
          if (model.e2.length >= 2) {
            int index = model.e2.removeLast();
            textControllers[index].text = '';
            model.e2.add(i);
          } else {
            model.e2.add(i);
          }
        }
        break;
      default:
    }
    if (!isMendatory) {
      context.read<ScoreBloc>().add(
            Update(
              model: ScoreModel(
                  slections: model.r1.length +
                      model.e2.length +
                      model.r2.length +
                      model.w3.length +
                      model.r0.length +
                      model.e0.length +
                      model.w0.length,
                  r0: model.r0,
                  w0: model.w0,
                  e0: model.e0,
                  r2: model.r2,
                  r1: model.r1,
                  w3: model.w3,
                  e2: model.e2),
            ),
          );
    }
  }

  void updateMendate(int i, String id, TextEditingController controller,
      BuildContext context, ScoreModel model) {
    int? data = int.tryParse(controller.text.trim());
    switch (id) {
      case "rm":
        if (data == null) {
          model.r0.remove(i);
          break;
        } else {
          if (!model.r0.contains(i)) {
            model.r0.add(i);
          }
          break;
        }
      case "wm":
        if (data == null) {
          model.w0.remove(i);
          break;
        }
        model.w0 = [i];
        break;
      case "em":
        if (data == null) {
          model.e0.remove(i);
          break;
        }
        model.e0 = [i];
        break;

      default:
    }

    if (controller.text.trim().length <= 1) {
      context.read<ScoreBloc>().add(
            Update(
              model: ScoreModel(
                  slections: model.r1.length +
                      model.e2.length +
                      model.r2.length +
                      model.w3.length +
                      model.r0.length +
                      model.e0.length +
                      model.w0.length,
                  r0: model.r0,
                  w0: model.w0,
                  e0: model.e0,
                  r2: model.r2,
                  r1: model.r1,
                  w3: model.w3,
                  e2: model.e2),
            ),
          );
    }
  }

  void icrease(TextEditingController controller) {
    int? data = int.tryParse(controller.text);
    if (data != null && data >= 0) {
      data += 1;
      controller.text = data.toString();
    }
  }
}
