import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/firestore_database.dart';
import 'package:sunshine_iith/widgets/shimmer/heads_shimmer.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';


class MGMTTeam extends ConsumerStatefulWidget {
   const MGMTTeam({super.key});

  @override
  ConsumerState<MGMTTeam> createState() => _MGMTTeamState();
}

class _MGMTTeamState extends ConsumerState<MGMTTeam> {
  

  bool isLoading = true;
  List<String> posArr = ['web-app-team' , 'finance-team', 'publicity-team' , 'content-team', 'photo-team', 'des-team', 'newsletter-team', 'logistics-team', 'video-team'];
  List<String> typeArr = ['Web & App Dev Team' , 'Finance Managers' , 'Publicity Team', 'Content Team' , 'Photography Team',
   'Design Team' ,'Newsletter Team', 'Logistics Team','Video Editorial Team'];

  @override
  void initState() {
    super.initState();
    isFirstOpen();
  }

  getData() async {
  Map<String, List> dataMap = {};
    print(DateTime.now());
    List<Future<List>> futures = [];
    for (var posItem in posArr) {
      futures.add(FirestoreData.getSpecificData('management-team',posItem));
    }
    List results = await Future.wait(futures);
    for (int i = 0; i < results.length; i++) {
      dataMap[posArr[i]] = results[i];
      print(results[i]);
    }
    print(DateTime.now());

    return dataMap;
  }

  addDataToProvider() async {
    Map<String, List> dataMap = await getData();
    for (int i = 0; i < dataMap.length; i++) {
      List data = dataMap[posArr[i]] ?? [];
      ref.read(managementDataDataProvider.notifier).addAllData(posArr[i], data);
    }
  }

  isFirstOpen() async {
    print('first open');
    if (ref.read(managementDataDataProvider)[posArr[0]] == null) {
      await addDataToProvider();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final setData = ref.watch(managementDataDataProvider);
    // List setData =[];

    // for (var posItem in posArr) {
    //   if (dataMap[posItem] != null && dataMap[posItem]!.isNotEmpty) {
    //     setData.addAll(dataMap[posItem]!);
    //   }
    // }

    return Scaffold(
      body: SingleChildScrollView(
        child: 
        isLoading? const HeadsShimmerEffect():
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            
            textWidget(typeArr.elementAt(0)),
            detailsWidget(setData[posArr[0]]!),

            textWidget(typeArr.elementAt(1)),
            detailsWidget(setData[posArr[1]]!),

            textWidget(typeArr.elementAt(2)),
            detailsWidget(setData[posArr[2]]!),

            textWidget(typeArr.elementAt(3)),
            detailsWidget(setData[posArr[3]]!),

            textWidget(typeArr.elementAt(4)),
            detailsWidget(setData[posArr[4]]!),

            textWidget(typeArr.elementAt(5)),
            detailsWidget(setData[posArr[5]]!),

            textWidget(typeArr.elementAt(6)),
            detailsWidget(setData[posArr[6]]!),

            textWidget(typeArr.elementAt(7)),
            detailsWidget(setData[posArr[7]]!),

            textWidget(typeArr.elementAt(8)),
            detailsWidget(setData[posArr[8]]!),

          ] ,
            
          
        ),
      ),
    );
  }

  Widget textWidget(String text){
    return 
      Padding(
            padding: const EdgeInsets.fromLTRB(0, 20 , 0, 20),
            child: Text(
            text,
            textAlign: TextAlign.center,
            style:const TextStyle(
            fontSize: 28,
            wordSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
    );
  }

  Widget detailsWidget(List list){
    return 
    ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:  list.length,
            // query: DataFetch.dataFromRTDB('management-team').child(pos), 
            itemBuilder: (context  , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: list[index]['name'], 
                  email: list[index]['email'], 
                  phone: list[index]['phone'], 
                  position: list[index]['position'], 
                  imageLink: list[index]['image']
                ),
              );
            }
      );
  }
}