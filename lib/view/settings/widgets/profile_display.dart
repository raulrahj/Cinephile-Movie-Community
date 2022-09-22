import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class ProfiileDisplay extends StatelessWidget {
  const ProfiileDisplay({
    Key? key,
    this.image,
    this.name,
  }) : super(key: key);
  final String? image;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          kHeight1,
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Theme.of(context).primaryColorLight),
              borderRadius: BorderRadius.circular(100),
              // color: kBlack
            ),
            child: CircleAvatar(
              
              backgroundImage: NetworkImage(image ?? profImg),
              radius: 64,
            ),
          ),
          Text(
            name ?? "User name",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
