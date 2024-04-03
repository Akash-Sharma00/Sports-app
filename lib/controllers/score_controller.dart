import 'package:flutter/cupertino.dart';

class ScoreController {

  List<String> wicketsAny3 = ["Caught", "Bowled", "LBW", "Run out", "Stumped"];
  List<String> extrasAny2 = ["Wide", "No Ball", "Leg Bye"];

  TextEditingController fixedWicket = TextEditingController();
  TextEditingController fixedExtra = TextEditingController();
  List<TextEditingController> runFixedController = [
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> run1Controller = [
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> run2Controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> wicket3Controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> extra2Controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<int> run0Selection = <int>[];
  List<int> run1Selection = <int>[];
  List<int> run2Selection = <int>[];
  List<int> wicketSelection = <int>[];
  List<int> extraSelection = <int>[];

  int totalSelections = 0;

  void selected() {}
}
