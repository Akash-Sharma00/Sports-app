import 'package:flutter/material.dart';

import '../widgets/data_card.dart';

class WicketTab extends StatelessWidget {
  final List<TextEditingController> w1;
  final List<TextEditingController> w2;
  final List<String> wicketTexts;
  const WicketTab({
    super.key,
    required this.w1,
    required this.w2, required this.wicketTexts,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataCard(
            fields: const ["Total wickets"],
            isMendatory: true,
            label: "Mendatory",
            textControllers: w1,
            id: 'wm', max: 0,
          ),
          DataCard(
            fields: wicketTexts,
            label: "Add Any 3",
            last: true,
            textControllers: w2,
            id: 'w3', max: 3,
          ),
        ],
      ),
    );
  }
}
