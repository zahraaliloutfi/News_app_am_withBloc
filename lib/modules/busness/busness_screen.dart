import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_am/layout/news_app/cubit/cubit_cubit.dart';
import 'package:news_am/shared/components/components.dart';

class BusnessScreen extends StatelessWidget {
  const BusnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = BlocProvider.of<NewsCubit>(context).busness;
        return articleBuilder(list,context);
      },
    );
  }
}
