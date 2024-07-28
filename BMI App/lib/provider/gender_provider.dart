import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderNotifier extends StateNotifier<int> {
  GenderNotifier(super.state);
}

final genderProvider = StateNotifierProvider<GenderNotifier, int>((ref) {
  return GenderNotifier(1);
});
