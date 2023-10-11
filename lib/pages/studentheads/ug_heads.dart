import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sunshine_iith/providers/team_data_provider.dart';
import 'package:sunshine_iith/services/firestore_data.dart';
import 'package:sunshine_iith/widgets/shimmer/heads_shimmer.dart';
import 'package:sunshine_iith/widgets/shimmer/skeleton.dart';
import 'package:sunshine_iith/widgets/shimmer/team_card_shimmer.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

class UgHeads extends ConsumerStatefulWidget {
  const UgHeads({super.key});

  @override
  ConsumerState<UgHeads> createState() => _UgHeadsState();
}

class _UgHeadsState extends ConsumerState<UgHeads> {
  bool isLoading = true;

  var posArr = {
    'ug-management-heads',
    'ug-mentor-heads',
    'ug-buddy-heads',
    'welfare-sec'
  };
  var typeArr = {
    'Management Heads',
    'Mentorship Heads',
    'Buddy Heads',
    'Welfare Secretary'
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

  Future<List> getWelfData() async {
    List data = await FirestoreData.getData(posArr.elementAt(3),'team-data');
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

  void addWelfDataToProvider(List data) {
    ref.read(teamDataProvider.notifier).addAllData(posArr.elementAt(3), data);
  }

  Future<void> isFirstOpen() async {
    print(DateTime.now());

    if (ref.read(teamDataProvider)[posArr.elementAt(0)] == null ||
        ref.read(teamDataProvider)[posArr.elementAt(1)] == null ||
        ref.read(teamDataProvider)[posArr.elementAt(2)] == null ||
        ref.read(teamDataProvider)[posArr.elementAt(3)] == null) {
      var futures = [
        getMgmtData(),
        getMentorData(),
        getBuddyData(),
        getWelfData()
      ];
      var results = await Future.wait(futures);
      addMgmtDataToProvider(results[0]);
      addMentorDataToProvider(results[1]);
      addBuddyDataToProvider(results[2]);
      addWelfDataToProvider(results[3]);
    }
    setState(() {
      isLoading = false;
    });

    print(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = ref.watch(teamDataProvider);
    List setDataMgmt = dataMap[posArr.elementAt(0)] ?? [];
    List setDataMntr = dataMap[posArr.elementAt(1)] ?? [];
    List setDataBudd = dataMap[posArr.elementAt(2)] ?? [];
    List setDataWelf = dataMap[posArr.elementAt(3)] ?? [];

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
                      itemCount: setDataMgmt.length,
                      // query: DataFetch.dataFromRTDB(posArr.elementAt(0)),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: DataShowingWidget(
                              name: setDataMgmt[index]['name'],
                              email: setDataMgmt[index]['email'],
                              phone: setDataMgmt[index]['phone'],
                              position: setDataMgmt[index]['position'],
                              imageLink: setDataMgmt[index]['image']),
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
                      itemCount: setDataMntr.length,
                      // query: DataFetch.dataFromRTDB(posArr.elementAt(0)),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: DataShowingWidget(
                              name: setDataMntr[index]['name'],
                              email: setDataMntr[index]['email'],
                              phone: setDataMntr[index]['phone'],
                              position: setDataMntr[index]['position'],
                              imageLink: setDataMntr[index]['image']),
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
                      itemCount: setDataBudd.length,
                      // query: DataFetch.dataFromRTDB(posArr.elementAt(0)),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: DataShowingWidget(
                              name: setDataBudd[index]['name'],
                              email: setDataBudd[index]['email'],
                              phone: setDataBudd[index]['phone'],
                              position: setDataBudd[index]['position'],
                              imageLink: setDataBudd[index]['image']),
                        );
                      }),

                  //welfare sec
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      typeArr.elementAt(3),
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
                      itemCount: setDataWelf.length,
                      // query: DataFetch.dataFromRTDB(posArr.elementAt(0)),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: DataShowingWidget(
                              name: setDataWelf[index]['name'],
                              email: setDataWelf[index]['email'],
                              phone: setDataWelf[index]['phone'],
                              position: setDataWelf[index]['position'],
                              imageLink: setDataWelf[index]['image']),
                        );
                      }),
                ],
              ),
      ),
    );
  }
}
