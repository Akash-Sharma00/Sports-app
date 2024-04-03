import 'package:flutter/material.dart';

import '../widgets/data_card.dart';

class ExtrasTab extends StatelessWidget {
  final List<TextEditingController> e1;
  final List<TextEditingController> e2;
  final List<String> extraText;
  const ExtrasTab({
    super.key,
    required this.e1,
    required this.e2, required this.extraText,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataCard(
            fields: const ["Total Extras"],
            isMendatory: true,
            max: 0,
            label: "Mendatory",
            textControllers: e1,
            id: 'em',
          ),
          DataCard(
            fields: extraText,
            label: "Add Any 2",
            last: true,
            max: 2,
            textControllers: e2,
            id: 'e2',
          ),
        ],
      ),
    );
  }
}
