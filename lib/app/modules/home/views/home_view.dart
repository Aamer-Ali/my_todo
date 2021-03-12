import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_todo/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:my_todo/app/modules/home/models/cards_model.dart';
import 'package:my_todo/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final primaryColor = Color(0xffe8816d);
    final imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRft9j1N5RomI96p0vldhtRrYqpXbyGuvBWQw&usqp=CAU";

    var cardList = [
      CardModel(totalTasks: 9, title: "Personal", completedTask: 5),
      CardModel(totalTasks: 5, title: "Work", completedTask: 4),
      CardModel(totalTasks: 4, title: "Professional", completedTask: 2),
    ];
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          children: [
            // Text(
            //   "Application Title",
            //   style: TextStyle(color: Colors.white, fontSize: 20),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(imageUrl)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: Text(
                      "Hello, User",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      "Hope you are good.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      "You have 8 task to complete.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Get.find<AuthenticationController>().signOut();
                        Get.toNamed(Routes.AUTHENTICATION);
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cardList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            print("TAPPED $index");
                            // Get.toNamed(Routes.DASHBOARD);
                          },
                          child: Container(
                            width: screenWidth * 0.8,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${cardList[index].totalTasks} Task",
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 20),
                                    ),
                                    Text(
                                      cardList[index].title,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: LinearProgressIndicator(
                                              value: completedTaskValue(
                                                  cardList[index].totalTasks,
                                                  cardList[index]
                                                      .completedTask),
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      primaryColor),
                                              backgroundColor: Colors.grey),
                                        ),
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                                "${completedTaskPercentage(cardList[index].totalTasks, cardList[index].completedTask)} %"))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double completedTaskValue(int total, int completed) {
    return completed / total;
  }

  String completedTaskPercentage(int total, int completed) {
    var data = completed / total * 100;
    return data.toStringAsFixed(0);
  }
}
