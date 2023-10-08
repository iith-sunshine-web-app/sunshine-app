import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/services/data_model.dart';


final dataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());

class DataNotifier extends StateNotifier<Map<String, List>> {
  DataNotifier() : super({});

void addData(String position, DataModel data) {
   if (!state.containsKey(position)) {
     state[position] = [];
   }
   state[position]!.add(data);
   state = {...state};
}

void addAllData(String position, List datas) {
    if (!state.containsKey(position)) {
      state[position] = [];
    }
    state[position]!.addAll(datas);
    state = {...state};
  }

}

