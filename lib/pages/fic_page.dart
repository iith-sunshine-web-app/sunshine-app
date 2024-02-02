import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/firestore_database.dart';
import 'package:sunshine_iith/widgets/headers.dart';
import 'package:sunshine_iith/widgets/shimmer/team_card_shimmer.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

class FICDataShow extends ConsumerStatefulWidget {
  // List data;
  const FICDataShow({super.key});

  @override
  ConsumerState<FICDataShow> createState() => _FICDataShowState();
}

class _FICDataShowState extends ConsumerState<FICDataShow> {
  // List<DataModel> setData = [];
  bool isLoading = true;

  @override
  void initState() {
    // getFicData();
    isFirstOpen();
    super.initState();
  }

  getFicData() async {
    List data = await FirestoreData.getData('fic', 'team-data');
    return data;
  }

  addDataToProvider(List data) {
    ref.read(teamDataProvider.notifier).addAllData('fic', data);
  }

  isFirstOpen() async {
    if (ref.read(teamDataProvider)['fic'] == null) {
      List list = await getFicData();
      addDataToProvider(list);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = ref.watch(teamDataProvider);
    List setData = dataMap['fic'] ?? [];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Headers(title: "FACULTY IN-CHARGE"),
            isLoading
                ? Expanded(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (ctx, index) {
                          return const TeamCardShimmer();
                        }),
                  )
                : Expanded(
                    child: Center(
                        child: ListView.builder(
                            itemCount: setData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 15, 0, 15),
                                child: DataShowingWidget(
                                  name: setData[index]['name'],
                                  email: setData[index]['email'],
                                  phone: setData[index]['phone'],
                                  position: setData[index]['position'],
                                  imageLink: setData[index]['image'],
                                ),
                              );
                            })),
                  )
          ],
        ),
      ),
    );
  }
}
