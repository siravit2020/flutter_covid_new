import 'package:flutter/material.dart';
import 'package:flutter_covid/utils/comma.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gender extends StatelessWidget {
  const Gender({
    Key key,
    @required int male,
    @required int female,
  })  : _male = male,
        _female = female,
        super(key: key);

  final int _male;
  final int _female;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Sex(
          count: _male,
          color: theme.primaryColorLight,
          gen: "male",
        ),
        SizedBox(
          width: 20,
        ),
        Sex(
          count: _female,
          color: theme.primaryColorDark,
          gen: "female",
        )
      ],
    );
  }
}

class Sex extends StatelessWidget {
  final int count;
  final Color color;
  final String gen;

  const Sex({
    Key key,
    this.count,
    this.color,
    this.gen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          right: 10,
          left: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 7),
                blurRadius: 10,
                color: theme.primaryColor.withOpacity(0.2),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              gen == "male" ? "assets/icons/masculine-user.svg" : "assets/icons/one-woman.svg",
              color: color,
              width: 70.w,
            ),
            Column(
              children: [
                Text(
                  comma(count.toString()),
                  style: theme.textTheme.subtitle1.copyWith(
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
