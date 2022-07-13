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
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
                  decoration: BoxDecoration(
                    color: liveOrderProvider.isButtonSelectedList[index]
                        ? kColorPrimaryPink
                        : kColorWhite,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: const Border.fromBorderSide(
                      BorderSide(
                        color: kColorPrimaryPink,
                        // width: 2,
                      ),
                    ),
                  ),
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
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

// ListView.separated(
//           itemBuilder: (context, index) {
//             return OrderFilterButton(
//               index: index,
//             );
//           },
//           separatorBuilder: (context, index) {
//             return const SizedBox(
//               width: 10,
//             );
//           },
//           itemCount: OrderStatus.orderStatusApiDefaults.length,
//           scrollDirection: Axis.horizontal,
//         )

// class OrderFilterButton extends StatefulWidget {
//   const OrderFilterButton({
//     super.key,
//     required this.index,
//   });

//   final int index;

//   @override
//   State<OrderFilterButton> createState() => _OrderFilterButtonState();
// }

// class _OrderFilterButtonState extends State<OrderFilterButton> {
//   Color buttonColor = kColorTextWhite;
//   Color textColor = kColorPrimaryPink;

//   String _buildButtonText(
//     BuildContext context,
//     int index,
//     LiveOrderProvider liveOrderProvider,
//   ) {
//     final orderCount = liveOrderProvider.orders.where((element) {
//       return element.status == OrderStatus.orderStatusApiDefaults[index];
//     }).length;
//     return '${OrderStatus.orderStatusApiDefaults[index].capitalize()} ($orderCount)';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LiveOrderProvider>(
//       builder: (context, liveOrderProvider, _) {
//         return ToggleButtons(
//           isSelected: isButtonSelectedList,
//           children: OrderStatus.orderStatusApiDefaults.map((element) {
//             return Text(
//               _buildButtonText(context, widget.index, liveOrderProvider),
//               style: AppTextStyles.semiBoldBody(
//                 color: textColor,
//               ),
//             );
//           }).toList(),
//         );

        // return GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       liveOrderProvider.filterOrderList(
        //         OrderStatus.orderStatusApiDefaults[widget.index],
        //       );
        //       if (buttonColor == kColorTextWhite) {
        //         buttonColor = kColorPrimaryPink;
        //         textColor = kColorTextWhite;
        //       } else {
        //         buttonColor = kColorTextWhite;
        //         textColor = kColorPrimaryPink;
        //       }
        //     });
        //   },
        //   child: AnimatedContainer(
        //     duration: const Duration(milliseconds: 300),
        //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        //     margin: const EdgeInsets.symmetric(
        //       vertical: 8,
        //     ),
        //     decoration: BoxDecoration(
        //       color: buttonColor,
        //       borderRadius: const BorderRadius.all(
        //         Radius.circular(10),
        //       ),
        //       border: const Border.fromBorderSide(
        //         BorderSide(
        //           color: kColorPrimaryPink,
        //           // width: 2,
        //         ),
        //       ),
        //       boxShadow: [
        //         BoxShadow(
        //           color: kColorBlack.withOpacity(0.2),
        //           blurRadius: 4,
        //           offset: const Offset(0, 3),
        //         ),
        //       ],
        //     ),
        //     child: Center(
        //       child: Text(
        //         _buildButtonText(context, widget.index, liveOrderProvider),
        //         style: AppTextStyles.semiBoldBody(
        //           color: textColor,
        //         ),
        //       ),
        //     ),
        //   ),
        // );
//       },
//     );
//   }
// }
