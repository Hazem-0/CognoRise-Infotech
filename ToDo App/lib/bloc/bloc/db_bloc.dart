import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/states/db_states.dart';
import 'package:todo/data/local/sqflite.dart';

class DbCubit extends Cubit<DbStates> {
  DbCubit() : super(DbInitial());

  Sqflite sql = new Sqflite();

  insertData(String query) async {
    int? response;
    try {
      response = await sql.insertData(query);
      emit(DbAddSuccess());
      return response;
    } catch (e) {
      print(e);
      emit(DbAddFailure());
      return response;
    }
  }

  deleteData(String query) async {
    int? response;
    try {
      response = await sql.deleteData(query);

      emit(DbDeleteSuccess());
      return response;
    } catch (e) {
      emit(DbDeleteFailure());
      return null;
    }
  }

  updateData(String query) async {
    int? response;
    try {
      response = await sql.updateData(query);
      emit(DbUpdateSuccess());
      return response;
    } catch (e) {
      emit(DbUpdateFailure());
      print(response);
      return null;
    }
  }

  fetchData(String query) async {
    try {
      emit(DbFetchSuccess());
      return await sql.readData(query);
    } catch (e) {
      emit(DbFetchFailure());
      return null;
    }
  }

  deleteDb() async {
    try {
      await sql.clearDb();
      emit(DbDeleteSuccess());
    } catch (e) {
      emit(DbDeleteFailure());
    }
  }
}
