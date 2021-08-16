import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderFlexible extends StatelessWidget {
  const HeaderFlexible({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FlexibleSpaceBar(
      background: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/giant.svg",
            height: 100.h,
            color: theme.accentColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'COVID-19',
                style: theme.textTheme.headline1,
              ),
              Text(
                'situation in Thailand',
                style: theme.textTheme.subtitle1.copyWith(
                  color: theme.accentColor.withOpacity(0.54),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
