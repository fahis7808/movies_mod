import 'package:auto_binding_field/auto_binding_field.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              AutoBindingTextField(
                value: '',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: context.textTheme.bodyLarge,
                  prefixIcon: Icon(Icons.search),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
