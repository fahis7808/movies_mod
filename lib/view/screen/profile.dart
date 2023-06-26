import 'package:flutter/material.dart';
import 'package:movies_mod/view/widget/sized_box.dar.dart';
import 'package:nb_utils/nb_utils.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: Icon(Icons.person,size: 100,),
                  ),
                ],
              ),
              const Height(20),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                child: Row(
                  children: [
                    Text('E mail :  ',style: context.textTheme.bodyLarge,),
                    Text('afup786@gmail.com',style: context.textTheme.displayMedium,),
                  ],
                ),
              ),
              ListTile(title: const Text('Watchlist'),onTap: (){},),
              ListTile(title: const Text('Download'),onTap: (){},),
              ListTile(title: const Text('Preference'),onTap: (){},),
              const Divider(
                thickness: 3,
              ),
              ListTile(title: const Text('Help & Legal'),onTap: (){},),
              ListTile(title: const Text('Logout'),onTap: (){},),
            ],
          ),
        ),
      ),
    );
  }
}