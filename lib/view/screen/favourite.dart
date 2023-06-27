import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Center(
        child: Text('No favourite shows',style: context.textTheme.displayLarge,),
      ),
    );
  }
}