import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_covid/configs/color.dart';
import 'package:flutter_covid/models/general_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets.dart';

class FrameShowList extends StatelessWidget {
  const FrameShowList({
    Key key,
    @required this.data,
  }) : super(key: key);

  final General data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
    );
  }
}
