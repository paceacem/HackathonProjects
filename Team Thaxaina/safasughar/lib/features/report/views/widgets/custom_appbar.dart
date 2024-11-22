import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safasughar/features/report/views/screens/reported_list_screen.dart';

const Color cPurple = Color.fromARGB(255, 100, 83, 148);

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 30);
    final lastCurve = Offset(30, size.height - 30);
    path.quadraticBezierTo(
      firstCurve.dx,
      firstCurve.dy,
      lastCurve.dx,
      lastCurve.dy,
    );
    final secondFirstCurve = Offset(0, size.height - 30);
    final secondLastCurve = Offset(size.width - 30, size.height - 30);
    path.quadraticBezierTo(
      secondFirstCurve.dx,
      secondFirstCurve.dy,
      secondLastCurve.dx,
      secondLastCurve.dy,
    );
    final thirdCurve = Offset(size.width, size.height - 30);
    final thirdLastCurve = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
      thirdCurve.dx,
      thirdCurve.dy,
      thirdLastCurve.dx,
      thirdLastCurve.dy,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color bgColor;
  final bool hideBackButton;
  const CustomAppBar({
    super.key,
    this.title = 'My Profile',
    this.bgColor = Colors.blue,
    this.hideBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: Container(
        height: 150,
        width: double.infinity,
        color: bgColor,
        child: SafeArea(
          child: Row(
            children: [
              hideBackButton
                  ? const SizedBox(
                      width: 20.0,
                    )
                  : IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) => const ReportedIssues(),
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              const Spacer(
                flex: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
