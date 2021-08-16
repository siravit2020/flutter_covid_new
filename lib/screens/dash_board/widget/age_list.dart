import 'package:flutter/material.dart';
import 'package:flutter_covid/models/general_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgeList extends StatelessWidget {
  const AgeList({
    Key key,
    @required this.infoCase,
  }) : super(key: key);

  final General infoCase;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Age(
          age: infoCase.ageMin,
          type: "L",
          title: "Youngest",
          color: theme.unselectedWidgetColor,
        ),
        SizedBox(
          width: 20,
        ),
        Age(
          age: infoCase.ageAvg.toDouble(),
          type: "C",
          title: "Average",
          color: theme.dialogBackgroundColor,
        ),
        SizedBox(
          width: 20,
        ),
        Age(
          age: infoCase.ageMax,
          type: "L",
          title: "Oldest",
          color: theme.errorColor,
        ),
      ],
    );
  }
}

class Age extends StatelessWidget {
  final double age;
  final String type;
  final String title;
  final Color color;

  const Age({
    Key key,
    @required this.age,
    @required this.type,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String age = this.age.toStringAsFixed(0);
    String ageType = " Y";
    if (this.age < 0.12) {
      age = (this.age * 10).toStringAsFixed(0);
      ageType = " M";
    }
    final themeColor = Theme.of(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          right: 5,
          left: 5,
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
                color: themeColor.primaryColor.withOpacity(0.2),
              )
            ]),
        child: Column(
          children: [
            Text(
              age + ageType,
              style: theme.textTheme.subtitle1.copyWith(
                color: color,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: theme.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
