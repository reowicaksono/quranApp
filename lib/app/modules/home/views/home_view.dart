import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quranapp/app/data/models/Surah.dart';
import 'package:quranapp/app/data/models/jadwalShalat.dart';
import 'package:quranapp/app/modules/home/views/home_doa.dart';
import 'package:quranapp/app/modules/home/views/home_surah.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Colors.blue,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Settings',
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    var a = controller.getAllJadwalShalat();
    final _tabPages = <Widget>[
      Center(child: HomeSurah()),
      Center(
          child: FutureBuilder(
              future: controller.getAllJadwalShalat(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset("assets/lottie/loading.json"),
                  );
                }
                if (!snapshot.hasData) {
                  return Text("data not found");
                }
                 Jadwalshalat jadwal = snapshot.data;
                return Text("${jadwal.data!.ashar}");
              })),
      Center(child: HomeDoa()),
    ];

    final _tabs = <Tab>[
      Tab(
        child: Text(
          "Surah",
          style: TextStyle(color: Colors.black),
        ),
      ),
      Tab(
        child: Text(
          "Juz",
          style: TextStyle(color: Colors.black),
        ),
      ),
      Tab(
        child: Text(
          "Doa-doa",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ];

    final tabsCurrentPage = <Widget>[
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: TabBarView(
              children: _tabPages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TabBar(
                  tabs: _tabs,
                  splashBorderRadius: BorderRadius.circular(20),
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.blue,
                )),
          ),
        ],
      ),
      Center(child: Text("Search", style: TextStyle(color: Colors.black))),
      Center(child: Text("Favourite", style: TextStyle(color: Colors.black))),
      Center(child: Text("Add item", style: TextStyle(color: Colors.black))),
    ];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Quran App', style: TextStyle(color: Colors.black)),
                Row(
                  children: [
                    Icon(
                      Icons.notification_add_outlined,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img/profile.jpg'),
                      radius: 20,
                    ),
                  ],
                )
              ],
            ),
            backgroundColor: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  tabsCurrentPage[0],
                  tabsCurrentPage[1],
                  tabsCurrentPage[2],
                  tabsCurrentPage[3],
                ],
              )),
        ),

        bottomNavigationBar: buildBottomNavigationMenu(context, controller),

        //floating
      ),
    );
  }
}
