import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter a phone number or email ',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.start,
            ),
            const Text(
              'Or just tap submit',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 200,
              height: 20,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '|',
                  border: InputBorder.none, // Remove the bottom line
                  contentPadding: EdgeInsets.symmetric(
                      vertical:
                          10.0), // Add space for the custom horizontal line
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  Get.back();
                  Get.to(() => const MainPage());
                },
                child: Text(
                  isLoading ? 'Please wait...' : 'Submit',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                )),
          ],
        ),
      ),
    );
  }
}
