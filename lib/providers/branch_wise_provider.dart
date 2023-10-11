import 'package:flutter_riverpod/flutter_riverpod.dart';

final nestedDataProvider = StateNotifierProvider<NestedDataNotifier, Map<String, Map<String, List>>>((ref) => NestedDataNotifier());

class NestedDataNotifier extends StateNotifier<Map<String, Map<String, List>>> {
  NestedDataNotifier() : super({});

  void addData(String outerKey, Map<String, List> innerData) {
    if (!state.containsKey(outerKey)) {
      state[outerKey] = {};
    }
    innerData.forEach((innerKey, dataList) {
      if (!state[outerKey]!.containsKey(innerKey)) {
        state[outerKey]![innerKey] = [];
      }
      state[outerKey]![innerKey]!.addAll(dataList);
    });
    state = {...state};
  }

  void addAllData(Map<String, Map<String, List>> data) {
    data.forEach((outerKey, innerData) {
      if (!state.containsKey(outerKey)) {
        state[outerKey] = {};
      }
      innerData.forEach((innerKey, dataList) {
        if (!state[outerKey]!.containsKey(innerKey)) {
          state[outerKey]![innerKey] = [];
        }
        state[outerKey]![innerKey]!.addAll(dataList);
      });
    });
    state = {...state};
  }
}
