import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quranapp/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quran App',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sudahkah Anda mengaji hari ini ?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Container(
                height: 400,
                width: 400,
                child: Lottie.asset("assets/lottie/quran.json")),
            Container(
              height: 50,
              width: 120,
                child: ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOME),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Mulai'),
            ))
          ],
        ),
      ),
    );
  }
}
