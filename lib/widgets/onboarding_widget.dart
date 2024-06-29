import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goread/utils/colors.dart';

class BuildOnboard extends StatelessWidget {
  final String image;
  final String title;
  final String body;
  const BuildOnboard(
      {super.key,
      required this.title,
      required this.body,
      required this.image});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final sizedBoxHeight = isPortrait ? 18.0 : 10.0;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.amiko(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Text(
            body,
            style: GoogleFonts.amiko(
              textStyle: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
