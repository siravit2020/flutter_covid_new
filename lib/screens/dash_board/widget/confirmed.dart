import 'package:flutter/material.dart';
import 'package:flutter_covid/utils/comma.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Confirmed extends StatelessWidget {
  const Confirmed({
    Key key,
    @required int confirmed,
    @required int newConfirmed,
  })  : _confirmed = confirmed,
        _newConfirmed = newConfirmed,
        super(key: key);

  final int _confirmed;
  final int _newConfirmed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
     
      padding: EdgeInsets.all(20),
     
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
        ],
      ),
      child: Column(
        children: [
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                comma(_confirmed.toString()),
                style: theme.textTheme.headline3,
              ),
              Text(
                " +${comma('$_newConfirmed')}",
                style: theme.textTheme.subtitle1.copyWith(
                  color: theme.hintColor,
                ),
              ),
            ],
          ),
          Text(
            "Cases",
            style: theme.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
