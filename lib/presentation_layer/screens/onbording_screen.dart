import 'package:flutter/material.dart';
import 'package:shop_app/presentation_layer/screens/login_screen.dart';
import 'package:shop_app/presentation_layer/shared/constants/color_constance.dart';
import 'package:shop_app/presentation_layer/shared/sized_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModels> onBoardingItem = [
    BoardingModels(
        image: 'assets/images/boarding3.gif',
        title: 'Screen Title 1',
        body: 'Screen body 1'),
    BoardingModels(
        image: 'assets/images/boarding3.gif',
        title: 'Screen Title 2',
        body: 'Screen body 2'),
    BoardingModels(
        image: 'assets/images/boarding3.gif',
        title: 'Screen Title 3',
        body: 'Screen body 3'),
  ];

  var boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                        (route) => false);
              },
              child: Text(
                "SKIP",
                style: TextStyle(
                    color: defaultColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.screenHeight! * .03),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: SizeConfig.screenHeight! * .65,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: boardController,
                    itemBuilder: (context, index) =>
                        buildOnBoardingItem(onBoardingItem[index]),
                    itemCount: onBoardingItem.length,
                    onPageChanged: (index) {
                      if (index == onBoardingItem.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .05,
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: onBoardingItem.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotColor: Colors.grey,
                        dotWidth: 10.0,
                        spacing: 5.0,
                        expansionFactor: 4,
                        activeDotColor: Colors.pinkAccent[200]!,
                      ),
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false);
                        } else {
                          boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                      ),
                      backgroundColor: Colors.pinkAccent[200],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardingItem(BoardingModels model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage("${model.image}"),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "${model.title}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * .02,
        ),
        Text(
          "${model.body}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class BoardingModels {
  String? image;

  String? title;

  String? body;

  BoardingModels(
      {required this.image, required this.title, required this.body});
}
