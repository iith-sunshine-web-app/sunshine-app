import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/firestore_database.dart';
import 'package:sunshine_iith/widgets/shimmer/heads_shimmer.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

class PgHeads extends ConsumerStatefulWidget {
  const PgHeads({super.key});

  @override
  ConsumerState<PgHeads> createState() => _PgHeadsState();
}

class _PgHeadsState extends ConsumerState<PgHeads> {
  bool isLoading = true;

  var posArr = {
    'pg-management-heads',
    'pg-mentor-heads',
    'pg-buddy-heads',
  };
  var typeArr = {
    'Management Heads',
    'Mentorship Heads',
    'Buddy Heads',
  };

  @override
  void initState() {
    super.initState();
    isFirstOpen();
  }

  Future<List> getMgmtData() async {
    List data = await FirestoreData.getData(posArr.elementAt(0),'team-data');
    return data;
  }

  Future<List> getMentorData() async {
    List data = await FirestoreData.getData(posArr.elementAt(1),'team-data');
    return data;
  }

  Future<List> getBuddyData() async {
    List data = await FirestoreData.getData(posArr.elementAt(2),'team-data');
    return data;
  }

  void addMgmtDataToProvider(List data) {
    ref.read(teamDataProvider.notifier).addAllData(posArr.elementAt(0), data);
  }

  void addMentorDataToProvider(List data) {
    ref.read(teamDataProvider.notifier).addAllData(posArr.elementAt(1), data);
  }

  void addBuddyDataToProvider(List data) {
    ref.read(teamDataProvider.notifier).addAllData(posArr.elementAt(2), data);
  }

  Future<void> isFirstOpen() async {
    print(DateTime.now());

    if (ref.read(teamDataProvider)[posArr.elementAt(0)] == null ||
        ref.read(teamDataProvider)[posArr.elementAt(1)] == null ||
        ref.read(teamDataProvider)[posArr.elementAt(2)] == null) {
      var futures = [
        getMgmtData(),
        getMentorData(),
        getBuddyData(),
      ];
      var results = await Future.wait(futures);
      addMgmtDataToProvider(results[0]);
      addMentorDataToProvider(results[1]);
      addBuddyDataToProvider(results[2]);
    }

    setState(() {
      isLoading = false;
    });
    print(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = ref.watch(teamDataProvider);
    List pgMgmtData = dataMap[posArr.elementAt(0)] ?? [];
    List pgMentorData = dataMap[posArr.elementAt(1)] ?? [];
    List pgBuddyData = dataMap[posArr.elementAt(2)] ?? [];
    return Scaffold(
      body: SingleChildScrollView(
        child: isLoading
            ? const HeadsShimmerEffect()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //management haeds
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      typeArr.elementAt(0),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
            // List setData =[];

    // for (var posItem in posArr) {
    //   if (dataMap[posItem] != null && dataMap[posItem]!.isNotEmpty) {
    //     setData.addAll(dataMap[posItem]!);
    //   }
    // }              itemCount: pgMgmtData.length,
                      // query: DataFetch.dataFromRTDB(posArr.elementAt(0)),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: DataShowingWidget(
                              name: pgMgmtData[index]['name'],
                              email: pgMgmtData[index]['email'],
                              phone: pgMgmtData[index]['phone'],
                              position: pgMgmtData[index]['position'],
                              imageLink: pgMgmtData[index]['image']),
                        );
                      }),

                  //mentor heads
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      typeArr.elementAt(1),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: pgMentorData.length,
                      // query: DataFetch.dataFromRTDB(posArr.elementAt(0)),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: DataShowingWidget(
                              name: pgMentorData[index]['name'],
                              email: pgMentorData[index]['email'],
                              phone: pgMentorData[index]['phone'],
                              position: pgMentorData[index]['position'],
                              imageLink: pgMentorData[index]['image']),
                        );
                      }),

                  //Buddy heads
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      typeArr.elementAt(2),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: pgBuddyData.length,
                      // query: DataFetch.dataFromRTDB(posArr.elementAt(0)),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: DataShowingWidget(
                              name: pgBuddyData[index]['name'],
                              email: pgBuddyData[index]['email'],
                              phone: pgBuddyData[index]['phone'],
                              position: pgBuddyData[index]['position'],
                              imageLink: pgBuddyData[index]['image']),
                        );
                      }),
                ],
              ),
      ),
    );
  }
}
