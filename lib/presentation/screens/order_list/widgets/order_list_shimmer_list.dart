import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_test/utils/colors.dart';

class OrderListShimmerList extends StatelessWidget {
  const OrderListShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 108,
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Container(
            decoration: BoxDecoration(
              color: kColorWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      ShimmerWidget.rectangular(
                        width: 62,
                        height: 16,
                      ),
                      SizedBox(height: 12),
                      ShimmerWidget.rectangular(
                        width: 35,
                        height: 14,
                      ),
                      SizedBox(height: 4),
                      ShimmerWidget.rectangular(
                        width: 130,
                        height: 14,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      ShimmerWidget.rectangular(
                        width: 87,
                        height: 15,
                      ),
                      SizedBox(height: 5),
                      ShimmerWidget.rectangular(
                        width: 97,
                        height: 20,
                        radius: 5,
                      ),
                      SizedBox(height: 4),
                      ShimmerWidget.rectangular(
                        width: 97,
                        height: 20,
                        radius: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget.rectangular({
    required this.width,
    required this.height,
    this.radius = 2,
    super.key,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: kColorWhite,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
