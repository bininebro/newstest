import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:infopage/main_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';
import 'model/news.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  List<News> news = [];
  String name = Get.arguments ?? '10AM';
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    try {
      String data = await rootBundle.loadString('assets/data$name.json');
      var jsonData = jsonDecode(data);
      var newJson = jsonData.map<News>((item) => News.fromJson(item)).toList();
      setState(() {
        news = newJson;
      });
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Text(
                    '12 13 23',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 35),
                  Text(
                    name,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .9,
              width: size.width * .9,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: news.length + 1,
                        itemBuilder: (context, index) {
                          if (news.length == index) {
                            return !isExpanded
                                ? GestureDetector(
                                    onTap: () {
                                      for (int i = 0; i < news.length; i++) {
                                        setState(() {
                                          news[i].isExpanded = true;
                                          isExpanded = true;
                                        });
                                      }
                                    },
                                    child: const Text(
                                      'Expand',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        child: const Text(
                                          'Home',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        onTap: () {
                                          Get.to(const MyHomePage());
                                          Get.back();
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          for (int i = 0;
                                              i < news.length;
                                              i++) {
                                            setState(() {
                                              news[i].isExpanded = false;
                                              isExpanded = false;
                                            });
                                          }
                                        },
                                        child: const Text(
                                          'Simplify',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      news[index].isExpanded =
                                          !news[index].isExpanded;
                                    });
                                  },
                                  child: Text(
                                    news[index].headline ?? '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                news[index].isExpanded
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            child: Image.network(
                                              news[index].imageSource ?? '',
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            news[index].imageName ?? "",
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            news[index].description ?? "",
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(height: 20),
                                          InkWell(
                                            child: const Text('Source',
                                                style: TextStyle(fontSize: 16)),
                                            onTap: () =>
                                                launch(news[index].source!),
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      )
                                    : Container(),
                              ],
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
