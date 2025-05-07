import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khata_app/screens/screen_add_account.dart';
import 'package:khata_app/screens/screen_auth_dashboard.dart';
import 'package:khata_app/screens/screen_update_account.dart';
import 'package:khata_app/theme_data/drawer_material.dart';

class ScreenAccountList extends StatefulWidget {
  const ScreenAccountList({super.key});

  @override
  State<ScreenAccountList> createState() => _ScreenAccountListState();
}

class _ScreenAccountListState extends State<ScreenAccountList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScreenAuthDashboard()),
                  (Route<dynamic> route) =>
                      false, // This condition removes all previous routes
                );
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text("Account List"),
      ),
      drawer: DrawerMaterial(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => const ScreenAddAccount()));
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("account").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapashot) {
            if (snapashot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapashot.hasData && snapashot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No data"),
              );
            }
            var data = snapashot.data!.docs;
            final sss = snapashot.data!.toString();
            print("ssssssssssssssssssss $sss");
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var ddd = data[index].data() as Map<String, dynamic>;
                  return ListItems(
                    docId: "${ddd["docId"]}",
                      wName: "${ddd["name"]}",
                      wAmount: "${ddd["amount"]}",
                      wContact: "${ddd["contact"]}");
                });
          }),
    );
  }
}

class ListItems extends StatefulWidget {
  final String docId; // Document ID for updating/deleting
  final String wName;
  final String wAmount;
  final String wContact;

  const ListItems({
    super.key,
    required this.docId, // Document ID parameter
    required this.wName,
    required this.wAmount,
    required this.wContact,
  });

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenUpdateAccount(
                docId: widget.docId, // Pass the document ID
                cName: widget.wName,
                cAmount: widget.wAmount,
                cContact: widget.wContact,
              ),
            ),
          );
        },
        title: Text(widget.wName),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Rupees: ${widget.wAmount}"),
            Text("Contact: ${widget.wContact}"),
          ],
        ),
      ),
    );
  }
}
