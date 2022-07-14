import 'package:flutter/material.dart';
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class ItemsExpansionPanelList extends StatelessWidget {
  const ItemsExpansionPanelList({
    super.key,
    required this.orderDetail,
  });

  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    if (orderDetail.items == null || orderDetail.items!.isEmpty) {
      return const Center(
        child: Text('No items'),
      );
    }
    return ListView.builder(
      itemCount: orderDetail.items!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = orderDetail.items![index];
        return ListTileTheme(
          dense: true,
          child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            title: Row(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 15,
                  ),
                  // width: 15,
                  child: Text(
                    '${item.quantity}',
                    style: AppTextStyles.mediumMedium(
                      color: kColorBlack.withOpacity(0.7),
                    ),
                  ),
                ),
                Text(
                  ' x ${item.menuName}',
                  style: AppTextStyles.mediumMedium(
                    color: kColorBlack.withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                if (item.attributes!.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(
                      Icons.info_outline,
                      color: kColorBlack,
                      size: 15,
                    ),
                  ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${item.total ?? ''} AED',
                  style: AppTextStyles.semiBoldMedium(),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: item.attributes!.isEmpty
                      ? [Text('No Add ons!', style: AppTextStyles.mediumBody())]
                      : item.attributes!
                          .map(
                            (e) => Text(
                              ' - ${e?.attribute}',
                              style: AppTextStyles.mediumBody(),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
            /* onExpansionChanged: (isOpen) {
            setState(() {
              _isOpen[index] = isOpen;
            });
          }, */
          ),
        );
      },
    );

    /* return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _isOpen[panelIndex] = !isExpanded;
        });
      },
      children: widget.orderDetail.items!.map((e) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (_, isOpen) => ItemTileWidget(orderItem: e),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${e.total} ',
                style: kTSOrderDetailScreenTitle2,
              ),
              Text(
                '${e.attributes?.length}',
                style: kTSOrderDetailScreenTitle2,
              ),
            ],
          ),
          isExpanded: _isOpen[widget.orderDetail.items!.indexOf(e)],
        );
      }).toList(),
    ); */
  }
}
