import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton(
      {super.key, required this.currentPage, required this.onPress});
  final int currentPage;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 65,
          height: 65,
          child: CustomPaint(
            painter: QuarterCircleProgressPainter(
              progress: getProgressValue(currentPage),
              activeColor: ColorsManager.mainGreen,
              gapSize: 15,
              // Edit here from withValues (alpha : .3)
              inactiveColor: Colors.grey.withAlpha(3),
            ),
          ),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: ColorsManager.mainGreen,
          child: IconButton(
            onPressed: onPress,
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

double getProgressValue(int currentPage) {
  final progressMap = {
    1: 0.50,
    2: 0.75,
    3: 1.0,
  };
  return progressMap[currentPage] ?? 0.25;
}

class QuarterCircleProgressPainter extends CustomPainter {
  final double progress; // نسبة التقدم (من 0 إلى 1)
  final Color activeColor; // لون الأجزاء المملوءة
  final Color inactiveColor; // لون الأجزاء غير المملوءة
  final double gapSize; // حجم الفاصل بين الأرباع

  QuarterCircleProgressPainter({
    required this.progress,
    required this.activeColor,
    required this.inactiveColor,
    required this.gapSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = inactiveColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..color = activeColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    double gapAngle = (gapSize / radius); // تحويل المسافة إلى زاوية

    for (int i = 0; i < 4; i++) {
      // تحديد زاوية البداية لكل ربع
      double startAngle = (pi / 2) * i - (pi / 4) + gapAngle / 2;

      double sweepAngle =
          (pi / 2) - gapAngle; // تقليل زاوية القوس لإضافة الفاصل

      // رسم الخلفية لكل ربع
      canvas.drawArc(rect, startAngle, sweepAngle, false, backgroundPaint);

      // تحديد لون الربع بناءً على نسبة التقدم
      // **التغيير هنا:** تحديد الربع المقابل للربع الحالي
      int quarterIndex = (i + 1) % 4; // إضافة 1 للحصول على الربع المقابل

      if (progress > quarterIndex * 0.25) {
        double activeSweep = sweepAngle;
        if (progress < (quarterIndex + 1) * 0.25) {
          activeSweep = (progress - quarterIndex * 0.25) / 0.25 * sweepAngle;
        }
        canvas.drawArc(rect, startAngle, activeSweep, false, progressPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
