import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/data/repo/trending_repo.dart';
import 'package:open_box/logic/bloc/movie_info/movie_info_bloc.dart';
import 'package:open_box/view/discover/trending/trending_card.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class HhorizontalWidget extends StatelessWidget {
  const HhorizontalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieInfoBloc, MovieInfoState>(
      builder: (context, state) {
        return LimitedBox(
            maxWidth: double.infinity,
            maxHeight: dHeight(context) / 4.9,
            child: state.isLoading
                ? const Center(
                    child: ProgressCircle(),
                  )
                : ListView.builder(
                    itemCount: state.trendingData!.results!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      final data = state.trendingData!.results![index];
                      return TrendingCardW(
                        data: data,
                      );
                    },
                  )
            //           } else {
            //             return const ProgressCircle();
            //           }
            //         }),
            );
      },
    );
  }
}
