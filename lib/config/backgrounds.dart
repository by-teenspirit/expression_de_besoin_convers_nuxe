import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class FinalBackGroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffE14200).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01365188, size.height * 0.01000000,
                size.width * 0.9726962, size.height * 0.9800000),
            bottomRight: Radius.circular(size.width * 0.03412969),
            bottomLeft: Radius.circular(size.width * 0.03412969),
            topLeft: Radius.circular(size.width * 0.03412969),
            topRight: Radius.circular(size.width * 0.03412969)),
        paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9761092, size.height * -0.1025000);
    path_1.lineTo(size.width * 0.02389078, size.height * -0.1025000);
    path_1.cubicTo(
        size.width * -0.01380785,
        size.height * -0.1025000,
        size.width * -0.04436860,
        size.height * -0.08011425,
        size.width * -0.04436860,
        size.height * -0.05250000);
    path_1.lineTo(size.width * -0.04436860, size.height * 1.270000);
    path_1.cubicTo(
        size.width * -0.04436860,
        size.height * 1.297615,
        size.width * -0.01380785,
        size.height * 1.320000,
        size.width * 0.02389078,
        size.height * 1.320000);
    path_1.lineTo(size.width * 0.9761092, size.height * 1.320000);
    path_1.cubicTo(
        size.width * 1.013809,
        size.height * 1.320000,
        size.width * 1.044369,
        size.height * 1.297615,
        size.width * 1.044369,
        size.height * 1.270000);
    path_1.lineTo(size.width * 1.044369, size.height * -0.05250000);
    path_1.cubicTo(
        size.width * 1.044369,
        size.height * -0.08011425,
        size.width * 1.013809,
        size.height * -0.1025000,
        size.width * 0.9761092,
        size.height * -0.1025000);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * -0.1030983, size.height * 0.6956325);
    path_2.cubicTo(
        size.width * -0.3134925,
        size.height * 0.6802775,
        size.width * -0.5440922,
        size.height * 0.6782075,
        size.width * -0.7949010,
        size.height * 0.6894200);
    path_2.cubicTo(
        size.width * -1.045706,
        size.height * 0.7006350,
        size.width * -1.196638,
        size.height * 0.6312150,
        size.width * -1.247689,
        size.height * 0.4811600);
    path_2.cubicTo(
        size.width * -1.298741,
        size.height * 0.3311075,
        size.width * -1.285887,
        size.height * 0.1927305,
        size.width * -1.209126,
        size.height * 0.06602850);
    path_2.cubicTo(
        size.width * -1.132365,
        size.height * -0.06067325,
        size.width * -1.003147,
        size.height * -0.1535035,
        size.width * -0.8214710,
        size.height * -0.2124625);
    path_2.cubicTo(
        size.width * -0.6415256,
        size.height * -0.2711850,
        size.width * -0.4453481,
        size.height * -0.2983325,
        size.width * -0.2485573,
        size.height * -0.2917475);
    path_2.cubicTo(
        size.width * -0.04828908,
        size.height * -0.2856425,
        size.width * 0.1703795,
        size.height * -0.2504800,
        size.width * 0.4074471,
        size.height * -0.1862612);
    path_2.cubicTo(
        size.width * 0.6445188,
        size.height * -0.1220420,
        size.width * 0.6646485,
        size.height * -0.02427860,
        size.width * 0.4678396,
        size.height * 0.1070288);
    path_2.cubicTo(
        size.width * 0.2710345,
        size.height * 0.2383367,
        size.width * 0.1792730,
        size.height * 0.3731000,
        size.width * 0.1925560,
        size.height * 0.5113200);
    path_2.cubicTo(
        size.width * 0.2058389,
        size.height * 0.6495400,
        size.width * 0.1072874,
        size.height * 0.7109775,
        size.width * -0.1030983,
        size.height * 0.6956325);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffF7F7F7).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 1.065956, size.height * 1.055575);
    path_3.cubicTo(
        size.width * 1.036741,
        size.height * 1.177165,
        size.width * 1.026031,
        size.height * 1.312800,
        size.width * 1.033829,
        size.height * 1.462477);
    path_3.cubicTo(
        size.width * 1.041628,
        size.height * 1.612152,
        size.width * 0.9363447,
        size.height * 1.690012,
        size.width * 0.7179829,
        size.height * 1.696053);
    path_3.cubicTo(
        size.width * 0.4996246,
        size.height * 1.702103,
        size.width * 0.3002693,
        size.height * 1.672343,
        size.width * 0.1199147,
        size.height * 1.606770);
    path_3.cubicTo(
        size.width * -0.06043959,
        size.height * 1.541197,
        size.width * -0.1901386,
        size.height * 1.450125,
        size.width * -0.2691819,
        size.height * 1.333550);
    path_3.cubicTo(
        size.width * -0.3482218,
        size.height * 1.216978,
        size.width * -0.3799829,
        size.height * 1.100140,
        size.width * -0.3644608,
        size.height * 0.9830375);
    path_3.cubicTo(
        size.width * -0.3489420,
        size.height * 0.8659350,
        size.width * -0.2908532,
        size.height * 0.7426400,
        size.width * -0.1901997,
        size.height * 0.6131550);
    path_3.cubicTo(
        size.width * -0.08954471,
        size.height * 0.4836725,
        size.width * 0.05227713,
        size.height * 0.4874750,
        size.width * 0.2352655,
        size.height * 0.6245700);
    path_3.cubicTo(
        size.width * 0.4182526,
        size.height * 0.7616625,
        size.width * 0.6097543,
        size.height * 0.8373725,
        size.width * 0.8097645,
        size.height * 0.8517000);
    path_3.cubicTo(
        size.width * 1.009768,
        size.height * 0.8660275,
        size.width * 1.095164,
        size.height * 0.9339850,
        size.width * 1.065956,
        size.height * 1.055575);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffF7F7F7).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * -0.6910102, size.height * 1.154602);
    path_4.cubicTo(
        size.width * -0.6368430,
        size.height * 1.035475,
        size.width * -0.5805836,
        size.height * 0.9393025,
        size.width * -0.5222355,
        size.height * 0.8660800);
    path_4.cubicTo(
        size.width * -0.4638874,
        size.height * 0.7928575,
        size.width * -0.3575836,
        size.height * 0.6899700,
        size.width * -0.2033259,
        size.height * 0.5574175);
    path_4.cubicTo(
        size.width * -0.04905904,
        size.height * 0.4248600,
        size.width * 0.04875392,
        size.height * 0.4495125,
        size.width * 0.09011331,
        size.height * 0.6313750);
    path_4.cubicTo(
        size.width * 0.1314724,
        size.height * 0.8132400,
        size.width * 0.2466570,
        size.height * 0.9374775,
        size.width * 0.4356655,
        size.height * 1.004095);
    path_4.cubicTo(
        size.width * 0.6246792,
        size.height * 1.070710,
        size.width * 0.6494949,
        size.height * 1.146335,
        size.width * 0.5101160,
        size.height * 1.230973);
    path_4.cubicTo(
        size.width * 0.3707372,
        size.height * 1.315608,
        size.width * 0.2221785,
        size.height * 1.356092,
        size.width * 0.06443857,
        size.height * 1.352423);
    path_4.cubicTo(
        size.width * -0.09330307,
        size.height * 1.348753,
        size.width * -0.2721884,
        size.height * 1.344647,
        size.width * -0.4722184,
        size.height * 1.340105);
    path_4.cubicTo(
        size.width * -0.6722457,
        size.height * 1.335560,
        size.width * -0.7451775,
        size.height * 1.273727,
        size.width * -0.6910102,
        size.height * 1.154602);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffF7F7F7).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
