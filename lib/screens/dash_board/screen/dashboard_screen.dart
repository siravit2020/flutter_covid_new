import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/utils/comma.dart';
import 'package:flutter_covid/cubit/covid19_cubit.dart';
import 'package:flutter_covid/models/today_model.dart';
import 'package:flutter_covid/screens/dash_board/widget/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Thailand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<Covid19Cubit>(context).state as FetchData;
    TodayModel today = bloc.today;
    var infoCase = bloc.infoCase;
    return SingleChildScrollView(
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            TextTitle(
              title: 'Situation Reports',
              subTitle: 'Last update : ',
              date: today.updateDate,
            ),
            Confirmed(
              confirmed: today.confirmed,
              newConfirmed: today.newRecovered,
            ),
            Status(
              hospital: today.hospitalized,
              newHospital: today.newHospitalized,
              totalDeath: today.deaths,
              newDeath: today.newDeaths,
              recovered: today.recovered,
              newRecovered: today.newRecovered,
            ),
            TextTitle(
              title: "General",
              subTitle: 'Last update : ',
              date: infoCase.date,
            ),
            Gender(
              male: infoCase.male,
              female: infoCase.female,
            ),
            AgeList(
              infoCase: infoCase,
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
