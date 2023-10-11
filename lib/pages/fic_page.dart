import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sunshine_iith/providers/team_data_provider.dart';
import 'package:sunshine_iith/services/data_model.dart';
import 'package:sunshine_iith/services/firestore_data.dart';
import 'package:sunshine_iith/widgets/shimmer/team_card_shimmer.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

// ignore: must_be_immutable
class FICDataShow extends ConsumerStatefulWidget {
  // List data;
  FICDataShow({super.key});

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

  getFicData() async{
    List data = await FirestoreData.getData('fic');
    return data;
  }

  addDataToProvider(List data){
    ref.read(teamDataProvider.notifier).addAllData('fic', data);
  }

  isFirstOpen()async{
    if(ref.read(teamDataProvider)['fic']==null){
      List list = await getFicData();
      addDataToProvider(list);
    }
    setState(() {
        isLoading= false;
      }); 
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = ref.watch(teamDataProvider);
    List setData = dataMap['fic'] ?? [] ;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
            child:  Text(
              "FACULTY IN-CHARGE",
              textAlign: TextAlign.center,
              style:  GoogleFonts.openSans(
                  // fontStyle: ,
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
            ),
          ),

            const SizedBox(height: 75.0,),
                
            isLoading?
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (ctx,index){
                return TeamCardShimmer();
              }),
            )
            :
            Expanded(
              child: Center(
                child: ListView.builder(
              itemCount: setData.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: DataShowingWidget(
                    name:setData[index]['name'],
                    email:setData[index]['email'],
                    phone:setData[index]['phone'],
                    position:setData[index]['position'],
                    imageLink:setData[index]['image'],

                  ),
                );
              }
            )
              ),
            )
            
          ],
        ),
      ),
    );
  }
}