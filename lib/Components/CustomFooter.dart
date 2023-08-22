import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/localization/LocaleUtils.dart';
import 'package:sample/styles/colors.dart';

class CustomFooter extends StatelessWidget {
  final Function() supportCallBack;
  final Function() sportCallBack;
  final Function() registerPressed;
  final Function() casinoPressed;

  const CustomFooter({
    super.key,
    required this.supportCallBack,
    required this.sportCallBack,
    required this.registerPressed,
    required this.casinoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                supportCallBack();
              },
              child: Container(
                color: ThemeColors.yellowAppBarColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.support,
                      color: Colors.white,
                    ),
                    Text(
                      LocaleUtils.getString(context, "support"),
                      style: testStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                sportCallBack();
              },
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.sports_bar_sharp,
                      color: Colors.white,
                    ),
                    Text(
                      LocaleUtils.getString(context, "sport"),
                      style: testStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                casinoPressed();
              },
              child: Container(
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.casino,
                      color: Colors.white,
                    ),
                    Text(
                      LocaleUtils.getString(context, "casino"),
                      style: testStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                registerPressed();
              },
              child: Container(
                color: ThemeColors.yellowAppBarColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.app_registration,
                      color: Colors.white,
                    ),
                    Text(
                      LocaleUtils.getString(context, "Register"),
                      style: testStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  testStyle() {
    return const TextStyle(fontSize: 17, color: Colors.white);
  }
}
