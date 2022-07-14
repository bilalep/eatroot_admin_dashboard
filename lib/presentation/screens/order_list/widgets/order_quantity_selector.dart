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

  @override
  Widget build(BuildContext context) {
    return Consumer<LiveOrderProvider>(
      builder: (context, liveOrderProvider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'You have ',
                  style: AppTextStyles.semiBoldExtraLarge(color: kColorWhite),
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
                  style: AppTextStyles.semiBoldExtraLarge(color: kColorWhite),
                ),
              ],
            ),
            OrderQuantityDropDown(
              text: liveOrderProvider.orderQuantitySelectedStatus,
              itemList: OrderStatus.orderStatusApiDefaults,
              callBack: (newValue) {
                setState(() {
                  liveOrderProvider.changeSelectedStatus(newValue);
                });
              },
            ),
            OrderQuantityDropDown(
              text: liveOrderProvider.orderQuantitySelectedTime,
              itemList: OrderStatus.timeList,
              callBack: (newValue) {
                setState(() {
                  liveOrderProvider.changeSelectedTime(newValue);
                });
              },
            ),
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
  OrderQuantityDropDown({
    super.key,
    required this.text,
    required this.itemList,
    required this.callBack,
  });

  String text;
  final List<String> itemList;
  void Function(String) callBack;

  @override
  State<OrderQuantityDropDown> createState() => _OrderQuantityDropDownState();
}

class _OrderQuantityDropDownState extends State<OrderQuantityDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconSize: 0,
          value: widget.text,
          elevation: 0,
          // isDense: true,
          // style: kTSOrderScreenSubTitleYellow,
          style: AppTextStyles.semiBoldExtraLarge(color: kColorYellow),
          onChanged: (String? newValue) {
            setState(() {
              widget.text = newValue!;
              widget.callBack(newValue);
            });
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
