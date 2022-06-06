import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quranapp/app/data/models/Surah.dart';
import 'package:quranapp/app/modules/home/views/home_doa.dart';
import 'package:quranapp/app/modules/home/views/home_surah.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    final _tabPages = <Widget>[
      Center(child: HomeSurah()),
      Center(child: Icon(Icons.add, size: 20, color: Colors.blue)),
      Center(child: HomeDoa()),
      
    ];

    final _tabs = <Tab>[
      Tab(child: Text("Surah", style: TextStyle(color: Colors.black),),),
      Tab(child: Text("Juz", style: TextStyle(color: Colors.black),),),
      Tab(child: Text("Doa-doa", style: TextStyle(color: Colors.black),),),
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
                Row(children: [
                  Icon(Icons.notification_add_outlined, color: Colors.amber,),
                  SizedBox(width: 10,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/img/profile.jpg'),
                  radius: 20,
                ),
                ],)
                
                ],
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(tabs: _tabs),
          
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: _tabPages,),
        ),
      ),
    );
  }
}
