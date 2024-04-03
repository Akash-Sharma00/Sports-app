import 'package:flutter/material.dart';

import '../widgets/data_card.dart';

class RunTab extends StatelessWidget {
  final List<TextEditingController> r1;
  final List<TextEditingController> r2;
  final List<TextEditingController> r3;
  final List<String> runsFixed;
  final List<String> runsany1;
  final List<String> runsany2;
  const RunTab(
      {super.key,
      required this.r1,
      required this.r2,
      required this.r3,
      required this.runsFixed,
      required this.runsany1,
      required this.runsany2});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataCard(
            fields: runsFixed,
            isMendatory: true,
            label: "Mendatory",
            textControllers: r1,
            id: 'rm',
            max: 0,
          ),
          DataCard(
            fields: runsany1,
            label: "Add Any 1",
            textControllers: r2,
            id: 'r1',
            max: 1,
          ),
          DataCard(
            fields: runsany2,
            label: "Add Any 2",
            last: true,
            textControllers: r3,
            id: 'r2',
            max: 2,
          ),
        ],
      ),
    );
  }
}
