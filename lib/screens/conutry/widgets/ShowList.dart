import 'package:flutter/material.dart';
import 'package:flutter_covid/models/general_model.dart';
import 'package:flutter_covid/utils/comma.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowList extends StatelessWidget {
  const ShowList({
    Key key,
    @required this.data,
  }) : super(key: key);

  final General data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
       
          margin: EdgeInsets.only(
            bottom: 15.h,
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 7.h),
                  blurRadius: 10,
                  color: theme.primaryColor.withOpacity(0.2),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.name[index],
                style: theme.textTheme.bodyText2,
              ),
              Text(
                comma('${data.country[data.name[index]]}'),
                style: theme.textTheme.bodyText2.copyWith(
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: data.country.length,
    );
  }
}
