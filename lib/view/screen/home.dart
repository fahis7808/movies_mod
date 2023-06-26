import 'package:flutter/material.dart';
import 'package:movies_mod/view/widget/app_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
