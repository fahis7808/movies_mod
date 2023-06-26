import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu),
          Text(
            'MOVIES MOD',
            style: context.textTheme.headlineMedium,
          ),
          const Icon(Icons.bookmark_border)
        ],
      ),
    );
  }
}
