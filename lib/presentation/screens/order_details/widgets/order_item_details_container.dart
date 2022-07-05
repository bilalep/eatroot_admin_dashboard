// import 'package:flutter/material.dart';
// import 'package:tech_test/models/order_details/order_detail.dart';
// import 'package:tech_test/utils/constants.dart';

// class OrderItemDetailsContainer extends StatelessWidget {
//   const OrderItemDetailsContainer({
//     super.key,
//     required this.orderDetail,
//   });

//   final OrderDetail orderDetail;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // const SizedBox(height: 10.0),
//           kDivider,
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'x${orderDetail.totalItems ?? ''} items',
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       '${orderDetail.amountToPay ?? ''} AED',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Text(orderDetail.paymentMethod ?? ''),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ListView.separated(
//             shrinkWrap: true,
//             itemBuilder: (_, index) {
//               if (orderDetail.items == null) {
//                 return const SizedBox();
//               }
//               return ItemTileWidget(
//                 orderItem: orderDetail.items![index],
//               );
//             },
//             separatorBuilder: (_, index) => kDivider,
//             itemCount: orderDetail.items!.length,
//           ), */

