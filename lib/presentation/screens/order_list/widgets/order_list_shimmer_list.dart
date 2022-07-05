import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OrderListShimmerList extends StatelessWidget {
  const OrderListShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 94,
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
                      height: 16,
                    ),
                    SizedBox(height: 5),
                    ShimmerWidget.rectangular(
                      width: 97,
                      height: 22,
                      radius: 5,
                    ),
                    SizedBox(height: 4),
                    ShimmerWidget.rectangular(
                      width: 97,
                      height: 22,
                      radius: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemCount: 10,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
