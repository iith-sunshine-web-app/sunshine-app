import 'package:flutter/material.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

class ExpansionTileWidget extends StatelessWidget {
  final String branchCode;
  final String branchName;
  final List data;
  final bool facRep;
  const ExpansionTileWidget(
      {Key? key,
      this.facRep = false,
      required this.branchCode,
      required this.branchName,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 240, 167, 32),
              child: Text(branchCode),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                child: Text(
                  branchName,
                ),
              ),
            ),
          ],
        ),
      ),
      children: [
        ListView.builder(
          itemCount:  data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
          return DataShowingWidget(
            facRep: facRep,
            name: data[index]['name'],
            email: data[index]['email'],
            phone: data[index]['phone'],
            position: data[index]['position'],
            imageLink: data[index]['image'],
          );
        })
      ],
    );
  }
}
