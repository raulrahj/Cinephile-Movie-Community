
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/register/signup_screen.dart';

class NewReleaseCardW extends StatelessWidget {
  const NewReleaseCardW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/new_release_detailed');
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 3, vertical: 4),
            width: double.infinity,
            height: dHeight(context) / 3,
            decoration: BoxDecoration(
                // color: Colors.accents[index].withOpacity(0.2),
                image: const DecorationImage(
                    image: NetworkImage(urlImg1), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(kRadius)),
          ),
          Positioned(
            right: 19,
            top: 15,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kRadius))),
              child: const Text('Book Now'),
            ),
          ),
          const Positioned(
              bottom: 5,
              child: LargeHeadlineWidget(title: 'Into the wild')),
          Positioned(
            bottom: 39,
            left: 21,
            child: Text(
              '12 MAY',
              style: GoogleFonts.oswald()
                  .copyWith(color: Theme.of(context).iconTheme.color),
            ),
          )
        ],
      ),
    );
  }
}
