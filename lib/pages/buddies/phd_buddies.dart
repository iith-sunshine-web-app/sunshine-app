import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/const/branch_data.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/firestore_database.dart';
import 'package:sunshine_iith/widgets/expansion_tile.dart';
import 'package:sunshine_iith/widgets/headers.dart';
import 'package:sunshine_iith/widgets/shimmer/expansion_tile_shimmer.dart';

class PhDBuddies extends ConsumerStatefulWidget {
  const PhDBuddies({super.key});

  @override
  ConsumerState<PhDBuddies> createState() => _PhDBuddiesState();
}

class _PhDBuddiesState extends ConsumerState<PhDBuddies> {
  List pos = BranchData().pgCodes;
  List branchName = BranchData().pgBranchName;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    isFirstOpen();
  }

  getData() async {
    Map<String, List> dataMap = {};
    List<Future<List>> futures = [];
    for (var posItem in pos) {
      futures.add(FirestoreData.getSpecificData('phd-buddy', posItem));
    }
    List results = await Future.wait(futures);
    for (int i = 0; i < results.length; i++) {
      dataMap[pos[i]] = results[i];
    }

    return dataMap;
  }

  addDataToProvider() async {
    Map<String, List> dataMap = await getData();
    // print(dataMap);
    for (int i = 0; i < dataMap.length; i++) {
      List data = dataMap[pos[i]] ?? [];
      ref.read(phdBuddyDataProvider.notifier).addAllData(pos[i], data);
    }
  }

  isFirstOpen() async {
    if (ref.read(phdBuddyDataProvider)[pos[0]] == null) {
      await addDataToProvider();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = ref.watch(phdBuddyDataProvider);
    List setData = [];

    for (var posItem in pos) {
      if (dataMap[posItem] != null && dataMap[posItem]!.isNotEmpty) {
        setData.addAll(dataMap[posItem]!);
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
      body: Column(
        children: [
          const Headers(title: 'PhD Buddies'),
          isLoading
              ? Expanded(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 50,
                      itemBuilder: (ctx, index) {
                        return const ExpansionTileShimmer();
                      }))
              : Expanded(
                  child: ListView.builder(
                      itemCount: pos.length,
                      itemBuilder: ((context, index) {
                        if (dataMap[pos[index]] != null &&
                            dataMap[pos[index]]!.isNotEmpty) {
                          return ExpansionTileWidget(
                              branchCode: pos[index].toString().toUpperCase(),
                              branchName: branchName[index],
                              data: dataMap[pos[index]]!);
                        } else {
                          return Container();
                        }
                      })))
        ],
      ),
    );
  }
}
