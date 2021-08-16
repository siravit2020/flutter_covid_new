import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/cubit/covid19_cubit.dart';
import 'package:flutter_covid/models/general_model.dart';
import 'package:flutter_covid/screens/conutry/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryInThailand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<Covid19Cubit>(context).state as FetchData;
    General data = bloc.infoCase;
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 40.h,
        bottom: 0,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'State quarantine',
                  style: theme.textTheme.headline2,
                ),
                Text(
                  'Last update : ' + data.date,
                  style: theme.textTheme.subtitle2,
                ),
              ],
            ),
          ),
          ShowList(data: data),
        ],
      ),
    ),
    );
  }
}
