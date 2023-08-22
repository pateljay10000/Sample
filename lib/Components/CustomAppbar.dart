import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/localization/LocaleUtils.dart';
import 'package:sample/styles/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() promotionPress;
  final Function() loginPressed;

  const CustomAppBar({
    super.key,
    required this.promotionPress,
    required this.loginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/capture.jpg',
                fit: BoxFit.contain,
                width: 120,
                height: 80,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.access_alarm),
                  color: Colors.white,
                  onPressed: promotionPress,
                ),
                Text(
                  LocaleUtils.getString(
                    context,
                    "promotions",
                  ),
                  style: const TextStyle(
                    color: ThemeColors.yellowAppBarColor,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            color: ThemeColors.yellowAppBarColor,
            child: Text(
              LocaleUtils.getString(context, 'login'),
              style: const TextStyle(color: Colors.white),
            ),
            // onPressed: onAction1Pressed,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
