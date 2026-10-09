

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customText extends StatelessWidget{
  final String mText;
  final Color color;
  final FontWeight fontWeight;
  final double size;
  final double latterSpacing;
  final TextAlign textAlign;

  customText({required this.mText, this.color = Colors.white, this.fontWeight = FontWeight.normal, this.size = 16, this.latterSpacing = 0, this.textAlign = TextAlign.start});
  @override
  Widget build(BuildContext context){
    return Text(mText,
      textAlign: textAlign,
      style: GoogleFonts.alata(color: color, fontWeight: fontWeight, fontSize: size, letterSpacing: latterSpacing,),);
  }
}
class fontFamilyCustomText extends StatelessWidget{
  final String mText;
  final Color color;
  final FontWeight fontWeight;
  final double size;
  final double latterSpacing;
  final TextAlign textAlign;

  fontFamilyCustomText({required this.mText, this.color = Colors.white, this.fontWeight = FontWeight.normal, this.size = 16, this.latterSpacing = 0, this.textAlign = TextAlign.start});
  @override
  Widget build(BuildContext context){
    return Text(mText,
      textAlign: textAlign,
      style: GoogleFonts.googleSansFlex(color: color, fontWeight: fontWeight, fontSize: size, letterSpacing: latterSpacing,),);
  }
}
