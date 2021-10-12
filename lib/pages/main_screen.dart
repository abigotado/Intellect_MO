import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intellect_mo/pages/products_page.dart';
import 'package:intellect_mo/pages/requests_page.dart';
import 'package:intellect_mo/pages/school_page.dart';
import 'package:intellect_mo/widgets/main_menu/main_menu.dart';
import 'package:intellect_mo/widgets/main_menu/types.dart';

import 'contacts_page.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final List<TabItem> mainMenu = [
    TabItem("Центр", 'assets/icons/Home.svg'),
    TabItem("Занятия", 'assets/icons/lessons.svg'),
    TabItem("Контакты", 'assets/icons/contacts.svg'),
    TabItem("Заявки", 'assets/icons/User_add_alt_fill.svg'),
  ];

  Color primaryColor;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: mainMenu.length, vsync: this, initialIndex: 0);

    _tabController.addListener(() {
      _handleTabSelection();
    });
  }

  void _handleTabSelection() {
    _tabController.index = _tabController.index;
    setState(() {
      switch (_tabController.index) {
        case 0:
          primaryColor = Color(0xFFF8FAFF);
          break;
        case 1:
          primaryColor = Color.fromRGBO(81, 140, 255, 1);
          break;
        default:
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(alignment: Alignment.bottomCenter, children: [
        TabBarView(
          controller: _tabController,
          children: [
            SchoolPage(),
            ProductsPage(),
            ContactsPage(),
            RequestsPage(),
          ],
        ),
        Container(
          margin: EdgeInsets.all(10.r),
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: MainMenu(
              tabs: mainMenu,
              tabController: _tabController,
            ),
          ),
        ),
      ]),
    );
  }
}
