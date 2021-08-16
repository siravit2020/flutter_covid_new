import 'package:flutter/material.dart';
import 'package:flutter_covid/utils/comma.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Status extends StatelessWidget {
  const Status({
    Key key,
    @required int hospital,
    @required int newHospital,
    @required int totalDeath,
    @required int newDeath,
    @required int recovered,
    @required int newRecovered,
  })  : _hospital = hospital,
        _newHospital = newHospital,
        _totalDeath = totalDeath,
        _newDeath = newDeath,
        _recovered = recovered,
        _newRecovered = newRecovered,
        super(key: key);

  final int _hospital;
  final int _newHospital;
  final int _totalDeath;
  final int _newDeath;
  final int _recovered;
  final int _newRecovered;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(
        top: 20.h,
        bottom: 10.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
   
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Counter(
                color: theme.unselectedWidgetColor,
                count: _hospital,
                increase: _newHospital,
                title: "Hospitalized",
              ),
              Counter(
                color: theme.errorColor,
                count: _totalDeath,
                increase: _newDeath,
                title: "Died",
              ),
              Counter(
                color: theme.focusColor,
                count: _recovered,
                increase: _newRecovered,
                title: "Recovered",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final Color color;
  final int count;
  final String title;
  final int increase;

  const Counter({
    Key key,
    @required this.color,
    @required this.count,
    @required this.increase,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Text(
              comma(count.toString()),
              style: theme.textTheme.headline4.copyWith(
                color: color,
              ),
            ),
            Text(
              "+" + "$increase",
              style: theme.textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: theme.textTheme.bodyText1,
        ),
      ],
    );
  }
}
