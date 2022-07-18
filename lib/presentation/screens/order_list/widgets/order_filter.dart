import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/extensions.dart';
import 'package:tech_test/utils/order_status.dart';
import 'package:tech_test/utils/text_styles.dart';

class OrderFilter extends StatefulWidget {
  const OrderFilter({super.key});

  @override
  State<OrderFilter> createState() => _OrderFilterState();
}

class _OrderFilterState extends State<OrderFilter> {
  String _buildButtonText(
    BuildContext context,
    int index,
    LiveOrderProvider liveOrderProvider,
  ) {
    final orderCount = liveOrderProvider.orders.where((element) {
      return element.status == OrderStatus.orderStatusApiDefaults[index];
    }).length;
    final buttonText = OrderStatus.orderStatusApiDefaults[index];
    return '${buttonText.capitalize()} ($orderCount)';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LiveOrderProvider>(
      builder: (context, liveOrderProvider, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ToggleButtons(
            selectedColor: kColorWhite,
            fillColor: Colors.transparent,
            splashColor: Colors.transparent,
            renderBorder: false,
            borderWidth: 5,
            borderRadius: BorderRadius.circular(10),
            isSelected: liveOrderProvider.isButtonSelectedList,
            onPressed: (index) {
              var count = 0;
              for (final val in liveOrderProvider.isButtonSelectedList) {
                if (val) count++;
              }

              if (liveOrderProvider.isButtonSelectedList[index] && count < 2) {
                return;
              }

              setState(() {
                liveOrderProvider.isButtonSelectedList[index] =
                    !liveOrderProvider.isButtonSelectedList[index];
                liveOrderProvider.filterOrderListByBoolList(
                  liveOrderProvider.isButtonSelectedList,
                );
              });
            },
            children: OrderStatus.orderStatusApiDefaults.map((element) {
              final index = OrderStatus.orderStatusApiDefaults.indexOf(element);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 4,
                ),
                child: Material(
                  color: liveOrderProvider.isButtonSelectedList[index]
                      ? kColorPrimaryPink
                      : kColorWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: kColorPrimaryPink,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
                    child: Text(
                      _buildButtonText(
                        context,
                        OrderStatus.orderStatusApiDefaults.indexOf(element),
                        liveOrderProvider,
                      ),
                      style: AppTextStyles.semiBoldBody(
                        color: liveOrderProvider.isButtonSelectedList[index]
                            ? kColorWhite
                            : kColorPrimaryPink,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
