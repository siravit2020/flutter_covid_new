import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String date;

  const TextTitle({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headline2,
          ),
          Text(
            subTitle + date,
            style: theme.textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
