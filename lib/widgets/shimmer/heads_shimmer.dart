import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sunshine_iith/widgets/shimmer/skeleton.dart';
import 'package:sunshine_iith/widgets/shimmer/team_card_shimmer.dart';

class HeadsShimmerEffect extends StatelessWidget {
  const HeadsShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
      Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.orange,
        child:  Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          alignment: Alignment.topCenter,
          child: Skeleton(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 40.0,
          ),
        ),
      ),
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (ctx, index) {
            return const TeamCardShimmer();
          })
    ],
    );
  }
}