import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_quantity_animator.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/order_status.dart';
import 'package:tech_test/utils/text_styles.dart';

class OrderQuantitySelector extends StatefulWidget {
  const OrderQuantitySelector({
    super.key,
  });

  @override
  State<OrderQuantitySelector> createState() => _OrderQuantitySelectorState();
}

class _OrderQuantitySelectorState extends State<OrderQuantitySelector> {
  String dropdownSelectedStatus = OrderStatus.orderStatusApiDefaults[0];

  String dropdownSelectedTime = OrderStatus.timeList[0];

  TextStyle get textStyle =>
      AppTextStyles.semiBoldExtraLarge(color: kColorWhite);

  @override
  Widget build(BuildContext context) {
    return Consumer<LiveOrderProvider>(
      builder: (context, liveOrderProvider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'You have ',
                  style: textStyle,
                ),
                Consumer<LiveOrderProvider>(
                  builder: (context, liveOrderProvider, _) {
                    return OrderQuantityAnimator(
                      endValue: liveOrderProvider.orderQuantity,
                    );
                  },
                ),
                Text(
                  ' orders',
                  style: textStyle,
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            OrderQuantityDropDown(
              text: liveOrderProvider.orderQuantitySelectedStatus,
              itemList: [
                ...OrderStatus.orderStatusApiDefaults,
                'yet to be fulfilled',
              ],
              callBack: (newValue) {
                setState(() {
                  liveOrderProvider.changeSelectedStatus(newValue);
                });
              },
            ),

            // OrderQuantityDropDown(
            //   text: liveOrderProvider.orderQuantitySelectedTime,
            //   itemList: OrderStatus.timeList,
            //   callBack: (newValue) {
            //     setState(() {
            //       liveOrderProvider.changeSelectedTime(newValue);
            //     });
            //   },
            // ),
            /* Text(
            'last 24 hours',
            style: kTextStyleOrderScreenSubTitleYellow,
          ),
           */
          ],
        );
      },
    );
  }
}

class OrderQuantityDropDown extends StatefulWidget {
  const OrderQuantityDropDown({
    super.key,
    required this.text,
    required this.itemList,
    required this.callBack,
    this.textStyle,
  });

  final String text;
  final List<String> itemList;
  final void Function(String) callBack;
  final TextStyle? textStyle;

  @override
  State<OrderQuantityDropDown> createState() => _OrderQuantityDropDownState();
}

class _OrderQuantityDropDownState extends State<OrderQuantityDropDown> {
  double iconSize = 24;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconSize: iconSize,
          iconEnabledColor: kColorYellow,
          value: widget.text,
          elevation: 0,
          // isDense: true,
          // style: kTSOrderScreenSubTitleYellow,
          style: widget.textStyle ??
              AppTextStyles.boldExtraLarge(color: kColorYellow),
          onTap: () {
            setState(() {
              iconSize = 0;
            });
          },
          onChanged: (String? newValue) {
            widget.callBack(newValue!);
            // setState(() {
            //   widget.text = newValue!;

            // });
          },
          items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
