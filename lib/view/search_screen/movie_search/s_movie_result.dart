import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/repo/movie_info_repo.dart';
import 'package:open_box/logic/cubit/search/search_cubit.dart';
import 'package:open_box/view/discover/widgets/movie_detailed.dart';
import 'package:open_box/view/search_screen/movie_search/s_review.dart';

class MovieSResult extends StatelessWidget {
  const MovieSResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return ListView.separated(
            separatorBuilder: (context, index) => none,
            itemCount: state.movieList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final data = state.movieList[index];
              return SizedBox(
                child: Stack(
                  children: [
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/movie_detailed',
                              arguments: MovieArg(
                                  image: data.backdropPath,
                                  title: data.originalTitle ?? data.title,
                                  overview: data.overview,
                                  genreList: data.genreIds,
                                  id: data.id));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 3),
                          height: dHeight(context) / 8.9,
                          // width: dWidth(context)/5,
                          color: kWhite,
                          child: Row(children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                  width: dWidth(context) / 13,
                                  height: dHeight(context) / 8.9,
                                  color: kBlack,
                                  child: data.backdropPath == null
                                      ? const Icon(
                                          Icons.group,
                                          size: 44,
                                        )
                                      : Image(
                                          image: NetworkImage(
                                              "$kImgHost/${data.backdropPath}"),
                                        )),
                            ),
                            kWidth1,
                            Expanded(
                              flex: 7,
                              child: Text(
                                data.originalTitle ?? 'Movie Name',
                                style:
                                    GoogleFonts.dmSans().copyWith(fontSize: 18),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 20,
                      child: ActionChip(
                        backgroundColor: kSecondary,
                        elevation: 2,
                        label: const Text(
                          "Reviews",
                          style: TextStyle(fontSize: 12),
                        ),
                        onPressed: () {
                          context
                              .read<SearchCubit>()
                              .getReview(movieId: data.id!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ReviewScreen()));
                        },
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}
