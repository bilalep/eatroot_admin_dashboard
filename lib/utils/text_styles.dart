import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_test/utils/colors.dart';

final kTSOrderTileTitle1 = GoogleFonts.montserrat(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  color: kColorPrimaryPink,
);

final kTSOrderTileSubTitleSemiTrans = GoogleFonts.montserrat(
  fontSize: 13,
  fontWeight: FontWeight.w600,
  color: Colors.black.withOpacity(0.5),
);

final kTSOrderTileSubTitle1 = GoogleFonts.montserrat(
  fontSize: 13,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

final kTSOrderTileSubTitle2 = GoogleFonts.montserrat(
  fontSize: 10,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

final kTSOrderScreenTitle = GoogleFonts.montserrat(
  fontSize: 42,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

final kTSOrderScreenSubTitle2 = GoogleFonts.montserrat(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Colors.white.withOpacity(0.7),
);

final kTSOrderScreenSubTitleWhite = GoogleFonts.montserrat(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: Colors.white,
  height: 1.2,
);

final kTSOrderScreenSubTitleYellow = GoogleFonts.montserrat(
  fontSize: 24,
  decoration: TextDecoration.underline,
  decorationThickness: 2,
  fontWeight: FontWeight.w600,
  color: kColorYellow,
  height: 1.2,
);

final kTSOrderScreenSubTitleYellowBold = GoogleFonts.montserrat(
  fontSize: 24,
  fontWeight: FontWeight.w800,
  color: kColorYellow,
  height: 1.2,
);

final kTSOrderDetailScreenAppBarTitle = GoogleFonts.montserrat(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

final kTSOrderDetailScreenTitle1 = GoogleFonts.montserrat(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: kColorBlack,
);

final kTSOrderDetailScreenTitle2 = GoogleFonts.montserrat(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: kColorBlack,
);

final kTSMedium13Black = GoogleFonts.montserrat(
  fontSize: 13,
  fontWeight: FontWeight.w500,
  color: kColorBlack,
);

final kTSMedium15Black = GoogleFonts.montserrat(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: kColorBlack,
  height: 1.5,
);

final kTSMedium18Black = GoogleFonts.montserrat(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: kColorBlack,
);

final kTSSemiBold18Black = GoogleFonts.montserrat(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: kColorBlack,
);

final kTSSemiBold15Black = GoogleFonts.montserrat(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  color: kColorBlack,
);

class AppTextStyles {
  static TextStyle _montserratBold(double size, {Color color = kColorBlack}) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  TextStyle _montserratMedium(double size, {Color color = kColorBlack}) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  TextStyle _montserratRegular(double size, {Color color = kColorBlack}) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle _montserratSemiBold(
    double size, {
    Color color = kColorBlack,
  }) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle get semiBoldBlackExtraSmall => _montserratSemiBold(10);

  static TextStyle get semiBoldBlackSmall => _montserratSemiBold(13);

  static TextStyle get semiBoldBlackMedium => _montserratSemiBold(15);

  static TextStyle get semiBoldPinkExtraSmall =>
      _montserratSemiBold(10, color: kColorPrimaryPink);

  static TextStyle get semiBoldPinkSmall =>
      _montserratSemiBold(13, color: kColorPrimaryPink);

  static TextStyle get semiBoldPinkMedium =>
      _montserratSemiBold(15, color: kColorPrimaryPink);
}
