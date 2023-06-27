import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_mod/provider/home_page_provider.dart';
import 'package:movies_mod/view/widget/sized_box.dar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider())
      ],
      child: Consumer<HomePageProvider>(builder: (context, value, child) {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Height(25),
                    Text(
                      'Trending this week',
                      style: context.textTheme.displayLarge,
                    ),
                    const Height(20),
                    CarouselSlider(
                      items: value.carousalList.map((e) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${e.backdropImage}'),
                                  fit: BoxFit.fill)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(e.title.toString(),style: context.textTheme.displayLarge,),
                                  ],
                                ),
                                Text(e.rating.toString(),style: context.textTheme.displayLarge,),
                              ],
                            ),
                          )
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),
                    Height(15),
                    Text(
                      'Popular Movies',
                      style: context.textTheme.displayLarge,
                    ),
                    Height(15),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.popularList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: SizedBox(
                                width: 120,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500${value.popularList[index].posterImage}'),
                                              fit: BoxFit.fill)),
                                    ),
                                    Text(
                                      value.popularList[index].title.toString(),
                                      style: context.textTheme.headlineSmall,maxLines: 2,overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                     value.popularList[index].overview.toString(),
                                      style: context.textTheme.labelSmall,maxLines: 2,overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Height(15),
                    Text(
                      'Trending Movies',
                      style: context.textTheme.displayLarge,
                    ),
                    Height(15),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.trendingList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: SizedBox(
                                width: 120,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500${value.trendingList[index].posterImage}'),
                                              fit: BoxFit.fill)),
                                    ),
                                    Text(
                                      value.trendingList[index].title.toString(),
                                      style: context.textTheme.headlineSmall,maxLines: 2,overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                     value.trendingList[index].overview.toString(),
                                      style: context.textTheme.labelSmall,maxLines: 2,overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
