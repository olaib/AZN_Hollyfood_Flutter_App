import 'package:flutter/material.dart';
import 'package:azn_hollyfood_flutter_app/widgets/title_text.dart';
import 'package:azn_hollyfood_flutter_app/utils/constants.dart';
import '../../models/user/user_entity.dart';
import '/services/database_services.dart';
import 'package:get_it/get_it.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UsersTable extends StatefulWidget {
  const UsersTable({super.key});

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  final DataBaseService _db = GetIt.I<DataBaseService>();
  List<UserEntity?> users = [];
  bool loading = false;

  Future<void> _getUsers() async {
    loading = true;
    await _db.getUsers().then((List<UserEntity?> dbUsers) {
      dbUsers.sort((a, b) => a!.rowNumber.compareTo(b!.rowNumber));
      setState(() {
        users = dbUsers;
      });
    });
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    _getUsers()
        .onError((error, stackTrace) => throw Exception('Error getting users'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Image(
            image: AssetImage('assets/images/logo.png'), height: 40),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(40, 40),
            ),
            onPressed:_getUsers,
            child: const FaIcon(FontAwesomeIcons.arrowsRotate, size: 15),
          ),
        ],
      ),
      body: loading
          ? const Center(child: LinearProgressIndicator())
          : _buildUsersTable(),
    );
  }

  Widget _buildUsersTable() {
    return ListView(
      children: <Widget>[
        const TitleText(label: 'טבלת משתמשים'),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: USER_TABLE_HEADERS.map((header) {
              return DataColumn(label: Text(header));
            }).toList(),
            rows: users.map((user) {
              return DataRow(
                cells: [
                  DataCell(Text(user!.rowNumber.toString())),
                  DataCell(Text(user.username)),
                  DataCell(Text(user.password)),
                  DataCell(Text(user.department.name)),
                  DataCell(Text(user.status.name)),
                  DataCell(Text(user.lastStatusTime.toString())),
                  DataCell(Text(user.timePeriodStatus.toString())),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
