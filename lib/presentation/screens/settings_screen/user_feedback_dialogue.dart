import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class UserFeedbackDialog extends StatefulWidget {
  const UserFeedbackDialog({
    super.key,
    required this.eventId,
    this.hub,
  }) : assert(eventId != const SentryId.empty());

  final SentryId eventId;
  final Hub? hub;

  @override
  State<UserFeedbackDialog> createState() => _UserFeedbackDialogState();
}

class _UserFeedbackDialogState extends State<UserFeedbackDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Oops, looks like you have encountered a problem',
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBoldMedium(),
            ),
            const SizedBox(height: 4),
            Text(
              'Please tell us about the problem you are experiencing so we can fix it for you',
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumBody(color: Colors.grey),
            ),
            const Divider(height: 24),
            TextField(
              key: const ValueKey('sentry_name_textfield'),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Name',
                hintStyle: AppTextStyles.mediumBody(color: Colors.grey),
              ),
              controller: nameController,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 8),
            TextField(
              key: const ValueKey('sentry_email_textfield'),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'E-Mail',
                hintStyle: AppTextStyles.mediumBody(color: Colors.grey),
              ),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            TextField(
              key: const ValueKey('sentry_comment_textfield'),
              minLines: 5,
              maxLines: null,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'What happened?',
                hintStyle: AppTextStyles.mediumBody(color: Colors.grey),
              ),
              controller: commentController,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 8),
            const _PoweredBySentryMessage(),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          key: const ValueKey('sentry_submit_feedback_button'),
          style: ElevatedButton.styleFrom(
            primary: kColorFlatBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () async {
            final nav = Navigator.of(context);
            final feedback = SentryUserFeedback(
              eventId: widget.eventId,
              comments: commentController.text,
              email: emailController.text,
              name: nameController.text,
            );
            await _submitUserFeedback(feedback);
            nav.pop();
          },
          child: Text(
            'Submit problem report',
            style: AppTextStyles.semiBoldSmall(
              color: kColorWhite,
            ),
          ),
        ),
        TextButton(
          key: const ValueKey('sentry_close_button'),
          style: TextButton.styleFrom(
            primary: kColorFlatBlue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Close',
            style: AppTextStyles.semiBoldSmall(
              color: kColorFlatBlue,
            ),
          ),
        )
      ],
    );
  }

  Future<void> _submitUserFeedback(SentryUserFeedback feedback) {
    return (widget.hub ?? HubAdapter()).captureUserFeedback(feedback);
  }
}

class _PoweredBySentryMessage extends StatelessWidget {
  const _PoweredBySentryMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Crash reports powered by',
            style: AppTextStyles.semiBoldBody(),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 30,
            child: Transform(
              transform: Matrix4.identity()..scale(0.9, 0.9),
              child: _SentryLogo(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SentryLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var color = Colors.white;
    final brightness = Theme.of(context).brightness;
    if (brightness == Brightness.light) {
      color = const Color(0xff362d59).withOpacity(1);
    }

    return FittedBox(
      child: CustomPaint(
        size: const Size(222, 66),
        painter: _SentryLogoCustomPainter(color),
      ),
    );
  }
}

/// Created with https://fluttershapemaker.com/
/// Sentry Logo comes from https://sentry.io/branding/
class _SentryLogoCustomPainter extends CustomPainter {
  _SentryLogoCustomPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.1306306, size.height * 0.03424242);
    path_0.arcToPoint(
      Offset(size.width * 0.09459459, size.height * 0.03424242),
      radius: Radius.elliptical(
        size.width * 0.02103604,
        size.height * 0.07075758,
      ),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.06495495, size.height * 0.2050000);
    path_0.arcToPoint(
      Offset(size.width * 0.1449099, size.height * 0.6089394),
      radius:
          Radius.elliptical(size.width * 0.1450901, size.height * 0.4880303),
    );
    path_0.lineTo(size.width * 0.1240991, size.height * 0.6089394);
    path_0.arcToPoint(
      Offset(size.width * 0.05445946, size.height * 0.2646970),
      radius:
          Radius.elliptical(size.width * 0.1246847, size.height * 0.4193939),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.02702703, size.height * 0.4242424);
    path_0.arcToPoint(
      Offset(size.width * 0.06860360, size.height * 0.6086364),
      radius:
          Radius.elliptical(size.width * 0.07171171, size.height * 0.2412121),
    );
    path_0.lineTo(size.width * 0.02081081, size.height * 0.6086364);
    path_0.arcToPoint(
      Offset(size.width * 0.01801802, size.height * 0.5918182),
      radius: Radius.elliptical(
        size.width * 0.003423423,
        size.height * 0.01151515,
      ),
    );
    path_0.lineTo(size.width * 0.03126126, size.height * 0.5160606);
    path_0.arcToPoint(
      Offset(size.width * 0.01612613, size.height * 0.4872727),
      radius:
          Radius.elliptical(size.width * 0.04837838, size.height * 0.1627273),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.003018018, size.height * 0.5630303);
    path_0.arcToPoint(
      Offset(size.width * 0.01063063, size.height * 0.6575758),
      radius: Radius.elliptical(
        size.width * 0.02045045,
        size.height * 0.06878788,
      ),
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.02081081, size.height * 0.6666667),
      radius: Radius.elliptical(
        size.width * 0.02099099,
        size.height * 0.07060606,
      ),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.08626126, size.height * 0.6666667);
    path_0.arcToPoint(
      Offset(size.width * 0.05022523, size.height * 0.4043939),
      radius:
          Radius.elliptical(size.width * 0.08738739, size.height * 0.2939394),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.06063063, size.height * 0.3437879);
    path_0.arcToPoint(
      Offset(size.width * 0.1070270, size.height * 0.6666667),
      radius:
          Radius.elliptical(size.width * 0.1075225, size.height * 0.3616667),
    );
    path_0.lineTo(size.width * 0.1624775, size.height * 0.6666667);
    path_0.arcToPoint(
      Offset(size.width * 0.08855856, size.height * 0.1848485),
      radius:
          Radius.elliptical(size.width * 0.1616216, size.height * 0.5436364),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.1095946, size.height * 0.06363636);
    path_0.arcToPoint(
      Offset(size.width * 0.1143243, size.height * 0.05954545),
      radius: Radius.elliptical(
        size.width * 0.003468468,
        size.height * 0.01166667,
      ),
    );
    path_0.cubicTo(
      size.width * 0.1167117,
      size.height * 0.06393939,
      size.width * 0.2057207,
      size.height * 0.5863636,
      size.width * 0.2073874,
      size.height * 0.5924242,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.2043243, size.height * 0.6095455),
      radius: Radius.elliptical(
        size.width * 0.003423423,
        size.height * 0.01151515,
      ),
    );
    path_0.lineTo(size.width * 0.1828829, size.height * 0.6095455);
    path_0.quadraticBezierTo(
      size.width * 0.1832883,
      size.height * 0.6384848,
      size.width * 0.1828829,
      size.height * 0.6672727,
    );
    path_0.lineTo(size.width * 0.2044144, size.height * 0.6672727);
    path_0.arcToPoint(
      Offset(size.width * 0.2252252, size.height * 0.5974242),
      radius: Radius.elliptical(
        size.width * 0.02067568,
        size.height * 0.06954545,
      ),
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.2224324, size.height * 0.5628788),
      radius: Radius.elliptical(
        size.width * 0.02022523,
        size.height * 0.06803030,
      ),
      clockwise: false,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.5600000, size.height * 0.4284848);
    path_0.lineTo(size.width * 0.4935135, size.height * 0.1396970);
    path_0.lineTo(size.width * 0.4769369, size.height * 0.1396970);
    path_0.lineTo(size.width * 0.4769369, size.height * 0.5268182);
    path_0.lineTo(size.width * 0.4937387, size.height * 0.5268182);
    path_0.lineTo(size.width * 0.4937387, size.height * 0.2301515);
    path_0.lineTo(size.width * 0.5621171, size.height * 0.5268182);
    path_0.lineTo(size.width * 0.5768018, size.height * 0.5268182);
    path_0.lineTo(size.width * 0.5768018, size.height * 0.1396970);
    path_0.lineTo(size.width * 0.5600000, size.height * 0.1396970);
    path_0.close();
    path_0.moveTo(size.width * 0.3925676, size.height * 0.3566667);
    path_0.lineTo(size.width * 0.4521622, size.height * 0.3566667);
    path_0.lineTo(size.width * 0.4521622, size.height * 0.3063636);
    path_0.lineTo(size.width * 0.3925225, size.height * 0.3063636);
    path_0.lineTo(size.width * 0.3925225, size.height * 0.1898485);
    path_0.lineTo(size.width * 0.4597748, size.height * 0.1898485);
    path_0.lineTo(size.width * 0.4597748, size.height * 0.1395455);
    path_0.lineTo(size.width * 0.3754054, size.height * 0.1395455);
    path_0.lineTo(size.width * 0.3754054, size.height * 0.5268182);
    path_0.lineTo(size.width * 0.4606306, size.height * 0.5268182);
    path_0.lineTo(size.width * 0.4606306, size.height * 0.4765152);
    path_0.lineTo(size.width * 0.3925225, size.height * 0.4765152);
    path_0.close();
    path_0.moveTo(size.width * 0.3224775, size.height * 0.3075758);
    path_0.lineTo(size.width * 0.3224775, size.height * 0.3075758);
    path_0.cubicTo(
      size.width * 0.2992793,
      size.height * 0.2887879,
      size.width * 0.2927928,
      size.height * 0.2739394,
      size.width * 0.2927928,
      size.height * 0.2378788,
    );
    path_0.cubicTo(
      size.width * 0.2927928,
      size.height * 0.2054545,
      size.width * 0.3013063,
      size.height * 0.1834848,
      size.width * 0.3140090,
      size.height * 0.1834848,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.3458559, size.height * 0.2221212),
      radius:
          Radius.elliptical(size.width * 0.05432432, size.height * 0.1827273),
    );
    path_0.lineTo(size.width * 0.3548649, size.height * 0.1792424);
    path_0.arcToPoint(
      Offset(size.width * 0.3143243, size.height * 0.1337879),
      radius:
          Radius.elliptical(size.width * 0.06351351, size.height * 0.2136364),
      clockwise: false,
    );
    path_0.cubicTo(
      size.width * 0.2915315,
      size.height * 0.1337879,
      size.width * 0.2756306,
      size.height * 0.1792424,
      size.width * 0.2756306,
      size.height * 0.2439394,
    );
    path_0.cubicTo(
      size.width * 0.2756306,
      size.height * 0.3136364,
      size.width * 0.2891441,
      size.height * 0.3377273,
      size.width * 0.3137387,
      size.height * 0.3578788,
    );
    path_0.cubicTo(
      size.width * 0.3356306,
      size.height * 0.3748485,
      size.width * 0.3423423,
      size.height * 0.3906061,
      size.width * 0.3423423,
      size.height * 0.4259091,
    );
    path_0.cubicTo(
      size.width * 0.3423423,
      size.height * 0.4612121,
      size.width * 0.3333333,
      size.height * 0.4830303,
      size.width * 0.3194144,
      size.height * 0.4830303,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.2820270, size.height * 0.4336364),
      radius:
          Radius.elliptical(size.width * 0.05558559, size.height * 0.1869697),
    );
    path_0.lineTo(size.width * 0.2718919, size.height * 0.4743939);
    path_0.arcToPoint(
      Offset(size.width * 0.3188288, size.height * 0.5327273),
      radius:
          Radius.elliptical(size.width * 0.07180180, size.height * 0.2415152),
      clockwise: false,
    );
    path_0.cubicTo(
      size.width * 0.3435135,
      size.height * 0.5327273,
      size.width * 0.3593694,
      size.height * 0.4880303,
      size.width * 0.3593694,
      size.height * 0.4189394,
    );
    path_0.cubicTo(
      size.width * 0.3592342,
      size.height * 0.3604545,
      size.width * 0.3489640,
      size.height * 0.3290909,
      size.width * 0.3224775,
      size.height * 0.3075758,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.8815315, size.height * 0.1396970);
    path_0.lineTo(size.width * 0.8468919, size.height * 0.3215152);
    path_0.lineTo(size.width * 0.8124775, size.height * 0.1396970);
    path_0.lineTo(size.width * 0.7923874, size.height * 0.1396970);
    path_0.lineTo(size.width * 0.8378378, size.height * 0.3737879);
    path_0.lineTo(size.width * 0.8378378, size.height * 0.5269697);
    path_0.lineTo(size.width * 0.8551351, size.height * 0.5269697);
    path_0.lineTo(size.width * 0.8551351, size.height * 0.3719697);
    path_0.lineTo(size.width * 0.9009009, size.height * 0.1396970);
    path_0.close();
    path_0.moveTo(size.width * 0.5904054, size.height * 0.1921212);
    path_0.lineTo(size.width * 0.6281081, size.height * 0.1921212);
    path_0.lineTo(size.width * 0.6281081, size.height * 0.5269697);
    path_0.lineTo(size.width * 0.6454054, size.height * 0.5269697);
    path_0.lineTo(size.width * 0.6454054, size.height * 0.1921212);
    path_0.lineTo(size.width * 0.6831081, size.height * 0.1921212);
    path_0.lineTo(size.width * 0.6831081, size.height * 0.1396970);
    path_0.lineTo(size.width * 0.5904505, size.height * 0.1396970);
    path_0.close();
    path_0.moveTo(size.width * 0.7631081, size.height * 0.3757576);
    path_0.cubicTo(
      size.width * 0.7804955,
      size.height * 0.3595455,
      size.width * 0.7901351,
      size.height * 0.3186364,
      size.width * 0.7901351,
      size.height * 0.2601515,
    );
    path_0.cubicTo(
      size.width * 0.7901351,
      size.height * 0.1857576,
      size.width * 0.7739640,
      size.height * 0.1389394,
      size.width * 0.7478829,
      size.height * 0.1389394,
    );
    path_0.lineTo(size.width * 0.6967117, size.height * 0.1389394);
    path_0.lineTo(size.width * 0.6967117, size.height * 0.5266667);
    path_0.lineTo(size.width * 0.7138288, size.height * 0.5266667);
    path_0.lineTo(size.width * 0.7138288, size.height * 0.3875758);
    path_0.lineTo(size.width * 0.7428829, size.height * 0.3875758);
    path_0.lineTo(size.width * 0.7720721, size.height * 0.5269697);
    path_0.lineTo(size.width * 0.7920721, size.height * 0.5269697);
    path_0.lineTo(size.width * 0.7605405, size.height * 0.3781818);
    path_0.close();
    path_0.moveTo(size.width * 0.7137838, size.height * 0.3378788);
    path_0.lineTo(size.width * 0.7137838, size.height * 0.1909091);
    path_0.lineTo(size.width * 0.7460811, size.height * 0.1909091);
    path_0.cubicTo(
      size.width * 0.7629279,
      size.height * 0.1909091,
      size.width * 0.7725676,
      size.height * 0.2177273,
      size.width * 0.7725676,
      size.height * 0.2642424,
    );
    path_0.cubicTo(
      size.width * 0.7725676,
      size.height * 0.3107576,
      size.width * 0.7622523,
      size.height * 0.3378788,
      size.width * 0.7462613,
      size.height * 0.3378788,
    );
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
