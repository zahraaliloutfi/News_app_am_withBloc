import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_am/layout/news_app/cubit/appcubit_cubit.dart';
import 'package:news_am/layout/news_app/cubit/cubit_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //      create: (BuildContext context) => NewsCubit()..getBusness()..getSports()..getScience(),
      create: (BuildContext context) => NewsCubit()..getBusness(),

      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = NewsCubit.get(context);
          var cubit = BlocProvider.of<NewsCubit>(context);
          // var cubit = NewsCubit();
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<AppCubit>(context).changeAppMode();
                  },
                  icon: const Icon(
                    Icons.brightness_4_rounded,
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.curruntIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              currentIndex: cubit.curruntIndex,
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
