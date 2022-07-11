import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/infrastructure/movie_info/movie_info.dart';
import 'package:open_box/logic/bloc/movie_info/movie_info_bloc.dart';
import 'package:open_box/view/discover/new_releases/new_release_card.dart';
import 'package:open_box/view/widgets/l_headline.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class NewReleaseScreen extends StatelessWidget {
  const NewReleaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieInfoBloc, MovieInfoState>(
      builder: (context, state) {
        return state.isLoading
            ? const AspectRatio(
                aspectRatio: 5 / 5,
                child: ProgressCircle(),
              )
            : ListView(
                children: [
                  const LargeHeadlineWidget(title: 'New Releases'),
                  ListView.builder(
                    // itemCount: state.newReleaseData!.length,
                    itemCount: state.newReleaseData!.results!.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = state.newReleaseData!.results![index];
                      return NewReleaseCardW(
                        data: data,
                      );
                    },
                  )
                ],
              );
      },
    );
  }
}
