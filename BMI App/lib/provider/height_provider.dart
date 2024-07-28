import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeightNotifier extends StateNotifier<double>
{
  HeightNotifier(super.state);

  void changeHeight(double value)
  {
      state=value;
  }

}
final heightProvider = StateNotifierProvider<HeightNotifier, double>((ref) {
  return HeightNotifier(170);
});