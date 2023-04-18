import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class themes {
  Color primaryColor = const Color(0xff3180E7);
  Color secondaryColor = const Color(0xff181336);
  Color tetiaryColor = const Color(0xff899a9a);
  Color darkerGreyColor = const Color.fromARGB(255, 81, 91, 111);
  Color backgroundColor = const Color(0xffEEF2F7);
  // Color appBarColor = const Color.fromARGB(255, 238, 242, 247);
  Color whiteColor = Colors.white;
  Color appBarColor = const Color(0xffEEF2F7);
  
  Color yellowColor = const Color.fromARGB(255, 255, 208, 58);
  // Color lightBlueColor = const Color.fromARGB(255, 212, 235, 235);
}

class TextStyles {
  TextStyle defaultText(final double? fontSize, final FontWeight? weight,
          final Color color) =>
      GoogleFonts.archivo(
        color: color,
        fontWeight: weight ?? FontWeight.w500,
        fontSize: fontSize ?? 19,
      );

      TextStyle kAlertTitleTextStyle = GoogleFonts.lato(
  fontSize: 20,
  fontWeight: FontWeight.w900,
  color: const Color.fromARGB(255, 24, 45, 77),
);

TextStyle kAlertContentTextStyle = GoogleFonts.lato(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: const Color.fromARGB(255, 144, 149, 160),
);

  //Blue Text

  TextStyle blueTextStyle400() => GoogleFonts.archivo(
        color: themes().primaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  TextStyle blackTextStyle(final double? fontSize, final FontWeight? weight) =>
      GoogleFonts.archivo(
        color: themes().secondaryColor,
        fontWeight: weight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
      );

  TextStyle purpleTextStyle() {
    return GoogleFonts.archivo(
      color: themes().tetiaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  //Black style

  TextStyle blackTextStyle400() {
    return GoogleFonts.archivo(
      color: themes().secondaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  TextStyle blackTextStyle700() {
    return GoogleFonts.archivo(
      color: themes().secondaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 19,
    );
  }

  //Grey

  TextStyle greyTextStyle400() {
    return GoogleFonts.archivo(
      color: themes().tetiaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  TextStyle greyTextStyle700() {
    return GoogleFonts.archivo(
      color: themes().tetiaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
  }

  TextStyle darkGreyTextStyle400() {
    return GoogleFonts.archivo(
      color: themes().darkerGreyColor,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  TextStyle darkGreyTextStyle700() {
    return GoogleFonts.archivo(
      color: themes().darkerGreyColor,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
  }
}
