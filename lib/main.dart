import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/configs/theme.dart';
import 'package:flutter_covid/cubit/covid19_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/main/nav_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 870),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: brownTeme,
        home: BlocProvider(
          create: (BuildContext context) => Covid19Cubit(),
          child: NavScreen(),
        ),
      ),
    );
  }
}
// NavScreen()
