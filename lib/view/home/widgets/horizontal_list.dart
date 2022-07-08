import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/infrastructure/movie_info/movie_info.dart';
import 'package:open_box/logic/bloc/trending/trending_bloc.dart';
import 'package:open_box/view/discover/trending/trending_card.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class HhorizontalWidget extends StatelessWidget {
  const HhorizontalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(
      builder: (context, state) {
        return LimitedBox(
          maxWidth: double.infinity,
          maxHeight: dHeight(context) / 4.9,
          child: state.isLoading
              ? const Center(
                  child: ProgressCircle(),
                )
              : FutureBuilder(
                  future: MovieInfo().getTrending(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.results.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          final data = snapshot.data.results[index];
                          return TrendingCardW(
                            data: data,
                          );
                        },
                      );
                    } else {
                      return ProgressCircle();
                    }
                  }),
        );
      },
    );
  }
}
