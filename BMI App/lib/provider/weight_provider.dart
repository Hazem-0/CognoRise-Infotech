import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightNotifier extends StateNotifier<double>
{
  WeightNotifier(super.state);

  void minusWeight(double value)
  {
    if(state<=500)
    state-=value;
  }
  void plusWeight(double value)
  {
    if(state>=10)
    state+=value;
  }
  void changeWeight(double value) {
    if (value >= 10 && value <= 200)
      state = value;
  }


}
final weightProvider = StateNotifierProvider<WeightNotifier, double>((ref) {
  return WeightNotifier(65);
});