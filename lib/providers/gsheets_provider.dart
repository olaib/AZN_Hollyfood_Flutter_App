import 'package:azn_hollyfood_flutter_app/controllers/user_controller.dart';
import 'package:azn_hollyfood_flutter_app/models/product.dart';
import 'package:azn_hollyfood_flutter_app/models/task.dart';
import 'package:get_it/get_it.dart';
import 'package:gsheets/gsheets.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';
import '../models/user/user_entity.dart';

// todo: gsheet repository and controller??
class GSheetsProvider {
  late final GSheets _gsheets;
  final String _sheetId;
  final Map<String, String> _credintial;
  final UserController _usersController = GetIt.I<UserController>();

  GSheetsProvider({
    required String sheetId,
    required Map<String, String> credintial,
  })  : _sheetId = sheetId,
        _credintial = credintial {
    _gsheets = GSheets(_credintial);
  }

  Future<List<List<dynamic>>> getSheetRecords(String sheetName) async {
    final worksheet = await getWorksheet(sheetName);
    Log.debug('worksheet: $worksheet');

    return (await worksheet!.values.allRows()).skip(1).toList();
  }

  Future<Worksheet?> getWorksheet(String sheetName) async {
    final spreadsheet = await _gsheets.spreadsheet(_sheetId);
    final worksheet = spreadsheet.worksheetByTitle(sheetName);
    if (worksheet == null) {
      throw Exception('גיליון בשם $sheetName לא נמצא');
    }
    return worksheet;
  }

  Future<List<UserEntity?>> getUsers(String sheetName) async {
    final records = await getSheetRecords(sheetName);
    Log.debug('Records: $records');

    // Use Future.wait to wait for all asynchronous operations to complete
    List<Future<UserEntity?>> userFutures = records.map((record) async {
      if (record[0] != null && int.tryParse(record[0].toString()) != null) {
        return await _usersController.createFromGSheet(record);
      } else {
        return null;
      }
    }).toList();

    // Wait for all futures to complete and return the list of UserEntity objects
    return await Future.wait(userFutures);
  }

  Future<void> addUser(String sheetName, UserEntity user) async {
    final worksheet = await getWorksheet(sheetName);
    bool isAppended = await worksheet!.values.appendRow([
      user.rowNumber,
      user.username,
      user.password,
      user.department,
      user.status,
      user.rowNumber,
      user.lastStatusTime.toIso8601String(),
      user.timePeriodStatus.toString(),
    ]);
    if (!isAppended) {
      // print('Error: User not added');
      throw Exception('יוזר לא התווסף');
    }
    Log.info('User added');
  }

  Future<List<T?>> getData<T>(
      String sheetName, T Function(List<dynamic>) fromSheets,
      {bool Function(List<dynamic>)? filter}) async {
    final records = await getSheetRecords(sheetName);
    Log.debug('Records: $records');

    return records
        .map((record) =>
            (filter != null && filter(record)) ? fromSheets(record) : null)
        .toList();
  }

  Future<List<Task?>> getPurchases() async {
    return await getData('Sheet7', Task.fromSheets,
        filter: (record) => record.length == 5);
  }

  Future<List<Product?>> getProductss() async {
    return await getData('Sheet7', Product.fromSheets,
        filter: (record) => record.length == 5);
  }

  Future<void> updateLogin(UserEntity user) async {
    final worksheet = await getWorksheet('test');
    final records = await getSheetRecords('test');
    final index =
        records.indexWhere((record) => record[0] == user.rowNumber.toString());
    if (index == -1) {
      throw Exception('יוזר לא נמצא');
    }
    user = await _usersController.updateLogin(user);
    records[index] = UserEntity.toSheets(user);
    await worksheet!.values.insertValue(records, column: 1, row: 1);
  }

  // update the
  Future<void> updateExit(UserEntity user) async {
    final worksheet = await getWorksheet('test');
    final records = await getSheetRecords('test');
    final index = records.indexWhere((record) => record[0] == user.rowNumber);
    if (index == -1) {
      throw Exception('יוזר לא נמצא');
    }
    user = await _usersController.updateExit(user);
    records[index] = UserEntity.toSheets(user);
    await worksheet!.values.insertValue(records, column: 1, row: 1);
  }
}
