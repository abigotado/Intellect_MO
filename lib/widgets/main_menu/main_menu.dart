import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/widgets/main_menu/types.dart';

class MainMenu extends StatefulWidget {
  final List<TabItem> tabs;
  final TabController tabController;

  const MainMenu({final Key key, this.tabs, this.tabController})
      : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(final BuildContext context) {
    return TabBar(
      labelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
      tabs: widget.tabs
          .map((final tab) => Tab(
              height: 70.h,
              text: tab.title,
              icon: SvgPicture.asset(tab.icon,
                  color: widget.tabs.indexOf(tab) == widget.tabController.index
                      ? Colors.white
                      : const Color.fromRGBO(0, 17, 51, 0.6))))
          .toList(),
      controller: widget.tabController,
      labelColor: Colors.white,
      unselectedLabelColor: const Color.fromRGBO(0, 17, 51, 0.6),
      indicator: const BoxDecoration(
        color: Color(0xFF518CFF),
      ),
    );
  }
}
