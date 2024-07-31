import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/states/checkbox_state.dart';
import 'package:todo/data/local/sqflite.dart';

class CheckboxCubit extends Cubit<CheckboxStates> {
  CheckboxCubit() : super(CheckboxInitial(checked: {0:false}));
  Sqflite sql = Sqflite();
  void toggle(bool state, int id) {
    bool updatedData =!state;
    if (state == false) {
      emit(CheckedState(checked: {id:updatedData}));
    } else {
      emit(UnCheckedState(checked: {id:updatedData}));
    }
    sql.updateData(''' UPDATE "tasks" SET "checked"="${updatedData}" 
                                    WHERE id="$id"
''');
  }
}
