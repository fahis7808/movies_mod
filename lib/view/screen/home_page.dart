import 'package:flutter/material.dart';
import 'package:movies_mod/view/widget/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../../provider/home_page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(create: (context) => HomePageProvider())
      ],
      child: Consumer<HomePageProvider>(builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.selectedIndex,
            onTap: (val){
              value.selectedIndex = val;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Favourite",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                label: "Profile",
              ),
            ],
          ),
          body: SafeArea(child: Column(children: [
            const CustomAppBar(),
            Expanded(child: value.pages[value.selectedIndex])
          ],)),
        );
      }),
    );
  }
}
