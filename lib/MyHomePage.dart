import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/Components/CustomFooter.dart';
import 'package:sample/localization/LocaleUtils.dart';
import 'package:sample/provider/HomeProvider.dart';
import 'package:sample/styles/colors.dart';
import 'package:video_player/video_player.dart';

import 'Components/AnimatedDigitBox.dart';
import 'Components/CustomAppbar.dart';
import 'Components/GradientText.dart';
import 'localization/Application.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
  ChewieController? chewieController;
  int _number = 88550;
  Timer? timer;
  HomeProvider? homeProvider;

  @override
  void initState() {
    super.initState();

    initLization();
    initTimer();
  }

  void initTimer() {
    if (timer != null && timer!.isActive) return;
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _number += 1;
      });
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (BuildContext context) => HomeProvider(context),
      child: Consumer(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          homeProvider = value;
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.black,
              appBar: CustomAppBar(
                promotionPress: () {},
                loginPressed: () {},
              ), // Use the custom AppHeader widget here
              body: ListView(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        homeProvider!.setIndex(index);
                      },
                    ),
                    // items: items,
                    items: homeProvider!.items.map((data) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: FittedBox(child: data),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  DotsIndicator(
                    dotsCount: homeProvider!.items.length,
                    position: homeProvider!.currentIndex,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      color: Colors.white,
                      activeColor: ThemeColors.yellowAppBarColor,
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    margin: const EdgeInsets.only(top: 20),
                    color: ThemeColors.yellowAppBarColor,
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.sizeOf(context).width,
                    color: ThemeColors.langColor,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            onLocaleChange(const Locale("en"));
                          },
                          child: Text(LocaleUtils.getString(context, "eng"),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: ThemeColors.langTextColor)),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            onLocaleChange(const Locale("hi"));
                          },
                          child: Text(
                            LocaleUtils.getString(context, "hindi"),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: ThemeColors.langTextColor),
                          ),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            onLocaleChange(const Locale("mr"));
                          },
                          child: Text(LocaleUtils.getString(context, "marathi"),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: ThemeColors.langTextColor)),
                        )),
                        Expanded(
                            child: InkWell(
                          onTap: () async {
                            onLocaleChange(const Locale("gu"));
                          },
                          child: Text(
                              LocaleUtils.getString(context, "gujarati"),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: ThemeColors.langTextColor)),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    color: ThemeColors.yellowAppBarColor,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(2),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ThemeColors.yellowAppBarColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "₹",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: _buildDigitBoxes(_number.toString()),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width,
                    child: GradientText(
                      LocaleUtils.getString(context, "live"),
                      style: const TextStyle(fontSize: 25),
                      gradient: const LinearGradient(colors: [
                        ThemeColors.yellowAppBarColor,
                        Colors.white,
                      ]),
                    ),
                  ),
                  Container(
                    height: 5,
                    margin: const EdgeInsets.only(top: 10),
                    color: ThemeColors.yellowAppBarColor,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                    height: 300,
                    decoration: BoxDecoration(
                        color: const Color(0xFF8400C5),
                        border: Border.all(
                            color: ThemeColors.yellowAppBarColor, width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(4.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Only one item in each row
                        mainAxisSpacing:
                            10.0, // Spacing between items vertically
                        crossAxisSpacing:
                            10.0, // Spacing between items horizontally
                      ),
                      itemCount: homeProvider!.users.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 180.0, // Fixed width for each item
                          height: 300.0, // Fixed height for each item
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const CircleAvatar(
                                    child: Icon(
                                  Icons.person,
                                  size: 35,
                                  color: Colors.white,
                                )),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        homeProvider!.users[index],
                                        style: const TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.white),
                                      ),
                                      const Text(
                                        "2 Sec ago",
                                        style: TextStyle(
                                            fontSize: 11.0, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 250,
                    child: chewieController != null
                        ? Chewie(
                            controller: chewieController!,
                          )
                        : Container(),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          width: 5,
                          color: ThemeColors.yellowAppBarColor,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              '${LocaleUtils.getString(context, "most_popular")} (${homeProvider!.myImageAndCaption.length})',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: ThemeColors.yellowAppBarColor),
                          onPressed: () {
                            homeProvider!.showAllData(!homeProvider!.showAll);
                          },
                          child: Text(
                            !homeProvider!.showAll
                                ? LocaleUtils.getString(context, "show_more")
                                : LocaleUtils.getString(context, "show_less"),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: homeProvider!.showAll
                        ? homeProvider!.myImageAndCaption.length
                        : 4,
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: ThemeColors.yellowAppBarColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(8.0),
                          child: Image.asset(
                              homeProvider!.myImageAndCaption[index]),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
              bottomNavigationBar: CustomFooter(
                supportCallBack: () {},
                registerPressed: () {},
                sportCallBack: () {},
                casinoPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> initLization() async {
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      autoInitialize: true,
      allowFullScreen: false,
      aspectRatio: 16 / 9,
      looping: false,
      autoPlay: false,
      showControlsOnInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
      videoPlayerController: videoPlayerController,
    );
  }

  void onLocaleChange(Locale locale) async {
    setState(() {
      application.onLocaleChanged!(locale);
    });
  }

  _buildDigitBoxes(String numberString) {
    List<Widget> digitWidgets = [];
    for (var i = 0; i < numberString.length; i++) {
      digitWidgets.add(
        AnimatedDigitBox(
          digit: int.parse(numberString[i]),
        ),
      );
    }
    return digitWidgets;
  }
}
