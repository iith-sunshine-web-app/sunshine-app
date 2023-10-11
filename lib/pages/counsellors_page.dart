import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sunshine_iith/providers/team_data_provider.dart';
import 'package:sunshine_iith/services/firestore_data.dart';
import 'package:sunshine_iith/widgets/shimmer/team_card_shimmer.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';


// ignore: must_be_immutable
class CounsellorsPage extends ConsumerStatefulWidget {
  const CounsellorsPage({super.key});

  @override
  ConsumerState<CounsellorsPage> createState() => _CounsellorsPageState();
}

class _CounsellorsPageState extends ConsumerState<CounsellorsPage> {

  List setData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    isFirstOpen();
  }
  getCounsellorsData() async{
    List data = await FirestoreData.getData('counsellors');
    return data;
  }
  addDataToProvider(List data){
    ref.read(teamDataProvider.notifier).addAllData('counsellors', data);
  }

  isFirstOpen()async{
    if(ref.read(teamDataProvider)['counsellors']==null){
      List list = await getCounsellorsData();
      addDataToProvider(list);
    }
    setState(() {
        isLoading= false;
      }); 
  }

  @override
  Widget build(BuildContext context) {
    final dataMap = ref.watch(teamDataProvider);
    List setData = dataMap['counsellors'] ?? [] ;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
              child:  Text(
                'COUNSELLORS',
                textAlign: TextAlign.center,
                style:  GoogleFonts.openSans(
                  // fontStyle: ,
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // const SizedBox(height: 35.0,),
            isLoading?
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (ctx,index){
                return const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TeamCardShimmer()
                  );
              }),
            )
            :
            Expanded(
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
          ],
        ),
      ),
    );
  }
}