import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/bloc/score_bloc.dart';
import 'package:sports_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScoreBloc(),
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, _) {
            return const MaterialApp(
              title: 'Material App',
              home: HomeScreen(),
            );
          }),
    );
  }
}
