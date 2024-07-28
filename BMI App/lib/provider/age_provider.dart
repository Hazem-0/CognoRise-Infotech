import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgeNotifier extends StateNotifier<int>
{
  AgeNotifier(super.state);

  void minusAge(int value)
  {
    if(state>2)
    state-=value;
  }
  void plusAge(int value)
  {
    if(state<120)
    state+=value;
  }
  void changeAge(int value)
  {
    if(value>=2&&value<=120)
      state=value ;
  }

}
final ageProvider = StateNotifierProvider<AgeNotifier, int>((ref) {
  return AgeNotifier(21);
});