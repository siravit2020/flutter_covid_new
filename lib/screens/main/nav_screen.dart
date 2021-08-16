import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid/configs/color.dart';
import 'package:flutter_covid/screens/widgets/header_flexible.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_covid/utils/comma.dart';
import 'package:flutter_covid/cubit/covid19_cubit.dart';
import 'package:flutter_covid/screens/main/screens.dart';
import 'package:flutter_covid/screens/main/customm_tab_bar_button.dart';

import "package:flutter_svg/flutter_svg.dart";

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<Covid19Cubit>(context).fetchData();
  }

  final List<Widget> _screens = [
    Thailand(),
    CountryInThailand(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.list,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: BlocBuilder<Covid19Cubit, Covid19State>(
        builder: (context, state) {
          if (state is FetchData)
            return DefaultTabController(
              length: _icons.length,
              child: Scaffold(
                backgroundColor: theme.backgroundColor,
                body: Container(
                  constraints: BoxConstraints(
                    minWidth: 600,
                  ),
                  color: theme.primaryColor,
                  child: NestedScrollView(
                    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverOverlapAbsorber(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          sliver: SliverAppBar(
                            backgroundColor: theme.primaryColor,
                            expandedHeight: 170.h,
                            elevation: 0,
                            leading: Icon(
                              Icons.menu,
                              color: theme.accentColor,
                            ),
                            flexibleSpace: HeaderFlexible(),
                            actions: [
                              IconButton(
                                icon: Icon(Icons.search),
                                color: theme.accentColor,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                    body: Center(
                      child: Container(
                        height: 1.sh,
                        constraints: BoxConstraints(
                          maxWidth: 800,
                        ),
                        decoration: BoxDecoration(
                          color: theme.backgroundColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: _screens,
                        ),
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              ),
            );
          return Container(
            color: theme.primaryColor,
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/giant.svg",
                width: 100,
                color: theme.accentColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
