import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sunshine_iith/widgets/shimmer/skeleton.dart';

class TeamCardShimmer extends StatelessWidget {
  const TeamCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Card(
            elevation: 1.6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color.fromARGB(255, 242, 186, 73),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.black,
                        highlightColor: Colors.orange,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.1),
                            radius: 120,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Shimmer.fromColors(
                          baseColor: Colors.black,
                          highlightColor: Colors.orange,
                          child: const Skeleton(
                            height: 30,
                            width: 160,
                          )),

                      // const SizedBox(height: 5.0,),
                      Shimmer.fromColors(
                          baseColor: Colors.black,
                          highlightColor: Colors.orange,
                          child: const Skeleton(
                            height: 25,
                            width: 200,
                          )),

                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Shimmer.fromColors(
                                baseColor: Colors.black,
                                highlightColor: Colors.orange,
                                child: Icon(CupertinoIcons.mail,
                                    size: 45,
                                    color: Colors.black.withOpacity(0.1))),
                            Shimmer.fromColors(
                                baseColor: Colors.black,
                                highlightColor: Colors.orange,
                                child: Icon(CupertinoIcons.phone,
                                    size: 45,
                                    color: Colors.black.withOpacity(0.1))),
                            Shimmer.fromColors(
                                baseColor: Colors.black,
                                highlightColor: Colors.orange,
                                child: Icon(FontAwesomeIcons.whatsapp,
                                    size: 45,
                                    color: Colors.black.withOpacity(0.1))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
