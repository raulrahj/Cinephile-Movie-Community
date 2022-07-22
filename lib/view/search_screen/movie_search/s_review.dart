import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/logic/cubit/search/search_cubit.dart';
import 'package:open_box/view/widgets/common.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({
    Key? key,
  }) : super(key: key);
  // final MovieReviewModel reviewData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: pop(context),
        title: const Text("Reviews"),
        centerTitle: true,
      ),
      body: SafeArea(child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              itemCount: state.reviewList.length,
              itemBuilder: (context, index) {
                final review = state.reviewList[index];
                return Card(
                  color: Theme.of(context).primaryColorLight,
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review.authorDetails!.username!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(review.content!),
                      ],
                    ),
                  ),
                );
              });
        },
      )),
    );
  }
}
