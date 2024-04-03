import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/bloc/score_bloc.dart';
import 'package:sports_app/models/leader_model.dart';
import 'package:sports_app/models/score_model.dart';
import 'package:sports_app/pallate.dart';
import 'package:sports_app/screens/extras_tab.dart';
import 'package:sports_app/screens/leader_board.dart';
import 'package:sports_app/screens/runs_tab.dart';
import 'package:sports_app/screens/wickets_tab.dart';
import 'package:sports_app/util/global.dart';
import 'package:sports_app/widgets/my_app_bar.dart';
import 'package:sports_app/widgets/my_button.dart';
import 'package:sports_app/widgets/score_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  List<TextEditingController> rMendate = [
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> rAdd1 = [
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> rAdd2 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> wAdd3 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> eAdd3 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  TextEditingController wMebdate = TextEditingController();
  TextEditingController eMebdate = TextEditingController();

  @override
  void dispose() {
    wMebdate.dispose();
    eMebdate.dispose();
    for (var element in rMendate) {
      element.dispose();
    }
    for (var controller in rAdd1) {
      controller.dispose();
    }
    for (var controller in rAdd2) {
      controller.dispose();
    }
    for (var controller in wAdd3) {
      controller.dispose();
    }
    for (var controller in eAdd3) {
      controller.dispose();
    }
    super.dispose();
  }

  List<String> runsFixed = ["Total Runs", "Highest Individual Score"];
  List<String> runsany1 = ["Dot's", "1's"];
  List<String> runsany2 = ["2's", "4's", "6's"];

  List<String> wicketText = ["Caught", "Bowled", "LBW", "Run out", "Stumped"];
  List<String> extraText = ["Wide", "No Ball", "Leg Bye"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Scoreboard 1",
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Pallate.conatinerBg,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff096774),
              Color(0xff0C393F),
            ],
          ),
        ),
        child: Column(
          children: [
            ScoreCard(
              onClear: () => clearAll(),
            ),
            TabBar(
              controller: tabController,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelColor: Pallate.appYellow,
              labelStyle: myTextStyle(color: Pallate.appGrey, fontSize: 12.sp),
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Pallate.appYellow,
              unselectedLabelStyle:
                  myTextStyle(color: Pallate.appGrey, fontSize: 12.sp),
              tabs: const [
                Tab(
                  text: 'RUNS',
                ),
                Tab(
                  text: 'WICKETS',
                ),
                Tab(
                  text: 'EXTRAS',
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  RunTab(
                    r1: rMendate,
                    r2: rAdd1,
                    r3: rAdd2,
                    runsany1: runsany1,
                    runsany2: runsany2,
                    runsFixed: runsFixed,
                  ),
                  WicketTab(
                    w1: [wMebdate],
                    w2: wAdd3,
                    wicketTexts: wicketText,
                  ),
                  ExtrasTab(
                    e1: [eMebdate],
                    e2: eAdd3,
                    extraText: extraText,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyOutlineButton(
                      onTap: () =>
                          gotoLeader(context, context.read<ScoreBloc>().state),
                      label: "Preview"),
                  BlocBuilder<ScoreBloc, ScoreModel>(
                    builder: (context, state) {
                      return MyElevatedButton(
                        onTap: () {
                          if (state.slections == 12) {
                            gotoLeader(context, state);
                          }
                        },
                        label: "Next",
                        active: state.slections == 12,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }

  void gotoLeader(BuildContext context, ScoreModel scores) {
    List<LeaderModel> model = [];
    for (var i = 0; i < scores.r0.length; i++) {
      model.add(
        LeaderModel(
            title: runsFixed[scores.r0[i]], val: rMendate[scores.r0[i]].text),
      );
    }
    if (wMebdate.text.isNotEmpty) {
      model.add(LeaderModel(title: "Total Wickets", val: wMebdate.text));
    }
    if (eMebdate.text.isNotEmpty) {
      model.add(LeaderModel(title: "Total Extras", val: eMebdate.text));
    }
    for (var i = 0; i < scores.r1.length; i++) {
      model.add(
        LeaderModel(
            title: runsany1[scores.r1[i]], val: rAdd1[scores.r1[i]].text),
      );
    }
    for (var i = 0; i < scores.r2.length; i++) {
      model.add(
        LeaderModel(
            title: runsany2[scores.r2[i]], val: rAdd2[scores.r2[i]].text),
      );
    }
    for (var i = 0; i < scores.e2.length; i++) {
      model.add(
        LeaderModel(
            title: extraText[scores.e2[i]], val: eAdd3[scores.e2[i]].text),
      );
    }
    for (var i = 0; i < scores.w3.length; i++) {
      model.add(
        LeaderModel(
            title: wicketText[scores.w3[i]], val: wAdd3[scores.w3[i]].text),
      );
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => LeaderBoard(model: model)));
  }

  void clearAll() {
    context.read<ScoreBloc>().add(
          Update(
            model: ScoreModel(
              slections: 0,
              r0: [],
              w0: [],
              e0: [],
              r2: [],
              r1: [],
              w3: [],
              e2: [],
            ),
          ),
        );

    wMebdate.clear();
    eMebdate.clear();
    for (var element in rMendate) {
      element.clear();
    }
    for (var controller in rAdd1) {
      controller.clear();
    }
    for (var controller in rAdd2) {
      controller.clear();
    }
    for (var controller in wAdd3) {
      controller.clear();
    }
    for (var controller in eAdd3) {
      controller.clear();
    }
  }
}
