import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/logic/bloc/trending/trending_bloc.dart';
import 'package:open_box/view/discover/trending/trending_card.dart';
import 'package:open_box/view/home/widgets/h_card_widget.dart';
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
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: state.trendingData!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final data = state.trendingData![0].results!;
                    print("Length of data is ${state.trendingData!.length}");
                    return TrendingCardW(
                      data: data[index],
                    );
                  },
                ),
        );
      },
    );
  }
}
