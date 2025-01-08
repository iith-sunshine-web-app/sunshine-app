import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/const/branch_data.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/firestore_database.dart';
import 'package:sunshine_iith/widgets/expansion_tile.dart';
import 'package:sunshine_iith/widgets/headers.dart';
import 'package:sunshine_iith/widgets/shimmer/expansion_tile_shimmer.dart';

class PhDWellBeing extends ConsumerStatefulWidget {
  const PhDWellBeing({super.key});

  @override
  ConsumerState<PhDWellBeing> createState() => _PhDWellBeingState();
}

class _PhDWellBeingState extends ConsumerState<PhDWellBeing> {
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
      futures.add(FirestoreData.getSpecificData('phd-well-being', posItem)); //CHECK
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
      ref.read(phdWellBeingDataProvider.notifier).addAllData(pos[i], data);
    }
  }

  isFirstOpen() async {
    if (ref.read(phdWellBeingDataProvider)[pos[0]] == null) {
      await addDataToProvider();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = ref.watch(phdWellBeingDataProvider);
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
          const Headers(title: 'PhD WellBeing'),
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
