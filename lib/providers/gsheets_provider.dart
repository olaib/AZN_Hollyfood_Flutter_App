import 'package:gsheets/gsheets.dart';
import 'package:azn_hollyfood_flutter_app/utils/log.dart';
import '/models/user_entity.dart';

class GSheetsProvider {
  late final GSheets _gsheets;
  final String _sheetId;
  final Map<String, String> _credintial;

  GSheetsProvider({
    required String sheetId,
    required Map<String, String> credintial,
  })  : _sheetId = sheetId,
        _credintial = credintial {
    _gsheets = GSheets(_credintial);
  }

  Future<List<List<dynamic>>> getSheetRecords(String sheetName) async {
    final worksheet = await getWorksheet(sheetName);
    return (await worksheet!.values.allRows()).skip(1).toList();
  }

  Future<Worksheet?> getWorksheet(String sheetName) async {
    final spreadsheet = await _gsheets.spreadsheet(_sheetId);
    final worksheet = await spreadsheet.worksheetByTitle(sheetName);
    if (worksheet == null) {
      throw Exception('גיליון בשם $sheetName לא נמצא');
    }
    return worksheet;
  }

  Future<List<UserEntity?>> getUsers(String sheetName) async {
    final records = await getSheetRecords(sheetName);
    return records
        .map((record) => (int.tryParse(record[0].toString()) != null)
            ? UserEntity.fromSheets(record)
            : null)
        .toList();
  }

  Future<void> addUser(String sheetName, UserEntity user) async {
    final worksheet = await getWorksheet(sheetName);
    // TODO: AUTH BY FIREBASE
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
}
