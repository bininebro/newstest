import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infopage/detailed_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Row(
            children: [
              Text(
                '12 13 23',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
              SizedBox(width: 35),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.to(
                    () => const DetailedPage(),
                    arguments: '10AM',
                  );
                },
                child: Text(
                  '10AM',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.to(
                    () => const DetailedPage(),
                    arguments: '3PM',
                  );
                },
                child: Text(
                  '3PM',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.to(
                    () => const DetailedPage(),
                    arguments: '8PM',
                  );
                },
                child: const Text(
                  '8PM',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
