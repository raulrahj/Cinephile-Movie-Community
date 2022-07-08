import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/infrastructure/movie_info/movie_info.dart';
import 'package:open_box/logic/bloc/trending/new_releases/new_releases_bloc.dart';
import 'package:open_box/view/discover/new_releases/new_release_card.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/widgets/l_headline.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class NewReleaseScreen extends StatelessWidget {
  const NewReleaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleasesBloc, NewReleasesState>(
      builder: (context, state) {
        return state.isLoading
            ? const ProgressCircle()
            : ListView(
                children: [
                  const LargeHeadlineWidget(title: 'New Releases'),
                  FutureBuilder(
                    future: MovieInfo().newRelease(),
                    builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          // itemCount: state.newReleaseData!.length,
                          itemCount: snapshot.data.results.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final data = snapshot.data.results[index];
                            return NewReleaseCardW(
                              data: data,
                            );
                          });
                    } else {
                      return const AspectRatio(
                          aspectRatio: 5/ 5, child: ProgressCircle());
                    }
                  })
                ],
              );
      },
    );
  }
}
