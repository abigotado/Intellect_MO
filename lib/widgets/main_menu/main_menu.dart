import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/widgets/main_menu/types.dart';

class MainMenu extends StatefulWidget {
  final List<TabItem> tabs;
  final TabController tabController;
  final bool isActiveTab;

  const MainMenu({Key key, this.tabs, this.tabController, this.isActiveTab}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: widget.tabs.map((tab) => Tab(text: tab.title, icon: SvgPicture.asset(tab.icon, color: widget.tabs.indexOf(tab) == activeTabIndex ? Colors.white : Color.fromRGBO(0, 17, 51, 0.6)))).toList(),
      controller: widget.tabController,
      labelColor: Colors.white,
      unselectedLabelColor: Color.fromRGBO(0, 17, 51, 0.6),
      indicator: BoxDecoration(
        color: Color(0xFF518CFF),
      ),
      onTap: (value){setState(() {
        activeTabIndex = value;
      });},
    );
  }
}


