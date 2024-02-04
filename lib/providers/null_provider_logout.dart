import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/providers/data_provider.dart';

class NullProviderAfterLogout {
  void nullAfterLogout(WidgetRef ref){
    ref.read(selectedTimeProvider.notifier).state = null;
    ref.read(selectedDateProvider.notifier).state = null;
    ref.read(isAdminProvider.notifier).state = false;
    ref.read(isGuestProvider.notifier).state = false;
    ref.read(sessionIdProvider.notifier).state = null;
  }
}