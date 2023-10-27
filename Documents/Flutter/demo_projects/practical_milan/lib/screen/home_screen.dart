import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practical_milan/controller/home_screen_controller.dart';
import 'package:practical_milan/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController controller = HomeScreenController();

  @override
  void initState() {
    controller.mapData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          elevation: 5,
          title: const Center(child: Text("Milan Practical")),
        ),
        backgroundColor: Colors.grey.shade200,
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.jsonData.keys.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(Detail_screen(
                          latitude: controller
                                  .jsonData[controller.jsonData.keys.elementAt(index)]
                              ["lat"],
                          longitude: controller
                              .jsonData[controller.jsonData.keys.elementAt(index)]
                          ["lon"],
                        name: controller
                            .jsonData[controller.jsonData.keys.elementAt(index)]
                        ["name"],
                        icao: controller
                            .jsonData[controller.jsonData.keys.elementAt(index)]
                        ["icao"],
                        city: controller
                            .jsonData[controller.jsonData.keys.elementAt(index)]
                        ["city"],
                        state: controller
                            .jsonData[controller.jsonData.keys.elementAt(index)]
                        ["state"],
                        country: controller
                            .jsonData[controller.jsonData.keys.elementAt(index)]
                        ["country"],
                        tz: controller
                            .jsonData[controller.jsonData.keys.elementAt(index)]
                        ["tz"],
                          ));
                    },
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2.5),
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.jsonData[controller.jsonData.keys
                                      .elementAt(index)]["name"]
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.jsonData[controller
                                            .jsonData.keys
                                            .elementAt(index)]["city"]
                                        .toString()),
                                    Text(controller.jsonData[controller
                                            .jsonData.keys
                                            .elementAt(index)]["state"]
                                        .toString()),
                                  ],
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text(controller.jsonData[controller
                                              .jsonData.keys
                                              .elementAt(index)]["icao"]
                                          .toString()),
                                      Text(controller.jsonData[controller
                                              .jsonData.keys
                                              .elementAt(index)]["country"]
                                          .toString()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )));
  }
}
