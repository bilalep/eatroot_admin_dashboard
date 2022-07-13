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
  color: kColorWhite,
);

final kTSOrderTileSubTitle2 = GoogleFonts.montserrat(
  fontSize: 10,
  fontWeight: FontWeight.w600,
  color: kColorWhite,
);

final kTSOrderScreenTitle = GoogleFonts.montserrat(
  fontSize: 42,
  fontWeight: FontWeight.w700,
  color: kColorWhite,
);

final kTSOrderScreenSubTitle2 = GoogleFonts.montserrat(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: kColorWhite.withOpacity(0.7),
);

final kTSOrderScreenSubTitleWhite = GoogleFonts.montserrat(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: kColorWhite,
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
  color: kColorWhite,
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
  static TextStyle semiBoldExtraSmall({Color color = kColorBlack}) =>
      _montserratSemiBold(10, color: color);

  static TextStyle semiBoldSmall({Color color = kColorBlack}) =>
      _montserratSemiBold(12, color: color);

  static TextStyle semiBoldBody({Color color = kColorBlack}) =>
      _montserratSemiBold(14, color: color);

  static TextStyle semiBoldMedium({Color color = kColorBlack}) =>
      _montserratSemiBold(17, color: color);

  static TextStyle semiBoldLarge({Color color = kColorBlack}) =>
      _montserratSemiBold(20, color: color);

  static TextStyle semiBoldExtraLarge({Color color = kColorBlack}) =>
      _montserratSemiBold(24, color: color);

  static TextStyle semiBoldHuge({Color color = kColorBlack}) =>
      _montserratSemiBold(29, color: color);

  static TextStyle mediumExtraSmall({Color color = kColorBlack}) =>
      _montserratMedium(10, color: color);

  static TextStyle mediumSmall({Color color = kColorBlack}) =>
      _montserratMedium(12, color: color);

  static TextStyle mediumBody({Color color = kColorBlack}) =>
      _montserratMedium(14, color: color);

  static TextStyle mediumMedium({Color color = kColorBlack}) =>
      _montserratMedium(17, color: color);

  static TextStyle mediumLarge({Color color = kColorBlack}) =>
      _montserratMedium(20, color: color);

  static TextStyle mediumExtraLarge({Color color = kColorBlack}) =>
      _montserratMedium(24, color: color);

  static TextStyle mediumHuge({Color color = kColorBlack}) =>
      _montserratMedium(29, color: color);

  static TextStyle regularExtraSmall({Color color = kColorBlack}) =>
      _montserratRegular(10, color: color);

  static TextStyle regularSmall({Color color = kColorBlack}) =>
      _montserratRegular(12, color: color);

  static TextStyle regularBody({Color color = kColorBlack}) =>
      _montserratRegular(14, color: color);

  static TextStyle regularMedium({Color color = kColorBlack}) =>
      _montserratRegular(17, color: color);

  static TextStyle regularLarge({Color color = kColorBlack}) =>
      _montserratRegular(20, color: color);

  static TextStyle regularExtraLarge({Color color = kColorBlack}) =>
      _montserratRegular(24, color: color);

  static TextStyle regularHuge({Color color = kColorBlack}) =>
      _montserratRegular(29, color: color);

  static TextStyle boldExtraSmall({Color color = kColorBlack}) =>
      _montserratBold(10, color: color);

  static TextStyle boldSmall({Color color = kColorBlack}) =>
      _montserratBold(12, color: color);

  static TextStyle boldBody({Color color = kColorBlack}) =>
      _montserratBold(14, color: color);

  static TextStyle boldMedium({Color color = kColorBlack}) =>
      _montserratBold(17, color: color);

  static TextStyle boldLarge({Color color = kColorBlack}) =>
      _montserratBold(20, color: color);

  static TextStyle boldExtraLarge({Color color = kColorBlack}) =>
      _montserratBold(24, color: color);

  static TextStyle boldHuge({Color color = kColorBlack}) =>
      _montserratBold(29, color: color);

  static TextStyle boldExtraHuge({Color color = kColorBlack}) =>
      _montserratBold(42, color: color);
}

TextStyle _montserratBold(double size, {Color color = kColorBlack}) {
  return GoogleFonts.montserrat(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: color,
    height: 1.5,
  );
}

TextStyle _montserratMedium(double size, {Color color = kColorBlack}) {
  return GoogleFonts.montserrat(
    fontSize: size,
    fontWeight: FontWeight.w500,
    color: color,
    height: 1.5,
  );
}

TextStyle _montserratRegular(double size, {Color color = kColorBlack}) {
  return GoogleFonts.montserrat(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: color,
    height: 1.5,
  );
}

TextStyle _montserratSemiBold(
  double size, {
  Color color = kColorBlack,
}) {
  return GoogleFonts.montserrat(
    fontSize: size,
    fontWeight: FontWeight.w600,
    color: color,
    height: 1.5,
  );
}
