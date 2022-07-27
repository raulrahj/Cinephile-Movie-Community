import 'package:flutter/material.dart';
import 'package:open_box/config/core.dart';
import 'package:shimmer/shimmer.dart';

class PListTile extends StatelessWidget {
  const PListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CustomWidget.circular(height: 44, width: 44),
      title: CustomWidget.rectangular(height: 14,width: 100,),
   trailing: Icon(Icons.more_vert_outlined),
    );
  }
}

class PTile extends StatelessWidget {
  const PTile({
    Key? key,
  }) : super(key: key);
  // final Size? size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.grey.withOpacity(0.6),
        child: const SizedBox(
          height: 140,
          width: double.infinity,
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(profImg),
          ),
        ));
  }
}

class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular(
      {Key? key, this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder(), super(key: key);

  const CustomWidget.circular(
      {Key? key, this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.grey[300]!,
        period: const Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400]!,
            shape: shapeBorder,
          ),
        ),
      );
}

Widget buildMovieShimmer(BuildContext context) => ListTile(
      leading: const CustomWidget.circular(height: 64, width: 64),
      title: Align(
        alignment: Alignment.centerLeft,
        child: CustomWidget.rectangular(
          height: 16,
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
      subtitle: const CustomWidget.rectangular(height: 14),
    );

// }

// class PListed extends StatelessWidget {
//   const PListed({Key? key, this.size = const Size(140, double.infinity)})
//       : super(key: key);
//   final Size? size;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         period: const Duration(seconds: 2),
//         baseColor: Colors.grey.withOpacity(0.1),
//         highlightColor: Colors.grey.withOpacity(0.6),
//         child: Expanded(
//           child: ListView.builder(
//             shrinkWrap: true,
//               itemCount: 4,
//               itemBuilder: (context, _) {
//                 return const PTile();
//               }),
//         ));
//   }
// }
