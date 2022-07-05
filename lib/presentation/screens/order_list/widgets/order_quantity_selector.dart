import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'You have ',
              style: kTSOrderScreenSubTitleWhite,
            ),
            Consumer<LiveOrderProvider>(
              builder: (context, value, _) {
                return Text(
                  value
                      .getNoOfOrderByStatusAndTime(
                        dropdownSelectedStatus,
                        dropdownSelectedTime,
                      )
                      .toString(),
                  style: kTSOrderScreenSubTitleYellowBold,
                );
              },
            ),
            Text(
              ' orders',
              style: kTSOrderScreenSubTitleWhite,
            ),
          ],
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconSize: 0,
            value: dropdownSelectedStatus,
            elevation: 0,
            style: kTSOrderScreenSubTitleYellow,
            onChanged: (String? newValue) {
              setState(() {
                dropdownSelectedStatus = newValue!;
              });
            },
            items: OrderStatus.orderStatusApiDefaults
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconSize: 0,
            value: dropdownSelectedTime,
            elevation: 0,
            style: kTSOrderScreenSubTitleYellow,
            onChanged: (String? newValue) {
              setState(() {
                dropdownSelectedTime = newValue!;
              });
            },
            items: OrderStatus.timeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        /* Text(
          'last 24 hours',
          style: kTextStyleOrderScreenSubTitleYellow,
        ),
         */
      ],
    );
  }
}
