abstract class CheckboxStates {
  Map<int,bool>checked;

  CheckboxStates({required this.checked}); 
}

class CheckboxInitial extends CheckboxStates {
  CheckboxInitial({required super.checked});
}

class CheckedState extends CheckboxStates {
  CheckedState({required super.checked});
}

class UnCheckedState extends CheckboxStates {
  UnCheckedState({required super.checked});
}
