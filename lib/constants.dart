import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const serverLocalhost = "192.168.72.119";
const serverHeroku = "192.168.1.3";

const Color primaryColor = Color(0xFFF67952);
const Color bgColor = Color(0xFFFBFBFD);


const Color appcolor = Color (0xff0f5eba);

const footballColorPrimary = Color(0xFF00A300);
const footballColorSecondary = Color(0xFFF1C0B9);

const tennisColorPrimary = Color(0xFFFF6E40);
const tennisColorSecondary = Color(0xffffd68A);

const kTextColor = Color(0xFF202E2E);
const kTextLigntColor = Color(0xFF7286A5);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;

const double appBarTitleSize = 22;

// news constants
const kGrey1 = Color(0xFF9F9F9F);
const kGrey2 = Color(0xFF6D6D6D);
const kGrey3 = Color(0xFFEAEAEA);
const kBlack = Color(0xFF1C1C1C);

var kNonActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(fontSize: 14.0, color: kGrey1),
);

var kActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 16.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var kCategoryTitle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
    fontWeight: FontWeight.bold,
  ),
);

var kDetailContent = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
  ),
);

var kTitleCard = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 18.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var descriptionStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 15.0,
      height: 2.0,
    ));