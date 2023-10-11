import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sunshine_iith/widgets/shimmer/skeleton.dart';

class ExpansionTileShimmer extends StatelessWidget {
  const ExpansionTileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 12, 0, 12),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.orange.shade300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black.withOpacity(0.2),
                ),
                const SizedBox(width: 5),
                Skeleton(
                  height: 28,
                  width: MediaQuery.of(context).size.width *0.72,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
