import 'package:flutter/material.dart';
import 'package:stckshaper/models/classes/deposit_module.dart';
import 'package:stckshaper/models/classes/user_module.dart';
import 'package:stckshaper/sqlite/database_connection.dart';
import 'package:stckshaper/style.dart';
import 'package:stckshaper/widgets/appbar_tile.dart';
import 'package:stckshaper/widgets/forms_dialog.dart';

class Administration extends StatefulWidget {
  const Administration({super.key});

  @override
  State<Administration> createState() => _AdministrationState();
}

class _AdministrationState extends State<Administration> {
  late List<User> users;

  void _fetchUsers() async {
    List<User> fetchedUsers = await DatabaseHelper().getUsers();
    setState(() {
      users = fetchedUsers;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, inScroll) => [
            SliverAppBar(
              toolbarHeight: 50,
              floating: true,
              snap: true,
              leadingWidth: MediaQuery.sizeOf(context).width / 2.5,
              leading: const MyTile(title: "Admin", subTitle: "Admin"),
              actions: [
                IconButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => const UserFormDialog(),
                    );
                  },
                  iconSize: 32,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(50, 50),
                  ),
                  icon: Icon(
                    Icons.add_rounded,
                    color: kMainColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(12),
                  icon: Image.asset(
                    "assets/icons/logout.png",
                    color: kSecondaryColor.withOpacity(0.8),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ],
          body: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 3,
                    color: kMainColorDarker,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: kMainColorDarker, width: 3),
                        ),
                      ),
                      child: Text(
                        "01",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 3,
                              color: kMainColorDarker,
                            ),
                          ),
                        ),
                        child: Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder(),
                      ),
                      icon: Icon(
                        Icons.edit_rounded,
                        color: kSecondaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder(),
                      ),
                      icon: Icon(
                        Icons.delete_rounded,
                        color: Colors.red[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
