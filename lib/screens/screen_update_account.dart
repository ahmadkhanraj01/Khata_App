import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScreenUpdateAccount extends StatefulWidget {
  final String docId; // Document ID to update or delete
  final String cName;
  final String cAmount;
  final String cContact;

  const ScreenUpdateAccount({
    super.key,
    required this.docId,
    required this.cName,
    required this.cAmount,
    required this.cContact,
  });

  @override
  State<ScreenUpdateAccount> createState() => _ScreenUpdateAccountState();
}

class _ScreenUpdateAccountState extends State<ScreenUpdateAccount> {
  late TextEditingController _amountController;
  late TextEditingController _nameController;
  late TextEditingController _contactController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing data
    _amountController = TextEditingController(text: widget.cAmount);
    _nameController = TextEditingController(text: widget.cName);
    _contactController = TextEditingController(text: widget.cContact);
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    _amountController.dispose();
    _nameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  Future<void> _updateData() async {
    final newAmount = _amountController.text;
    final newName = _nameController.text;
    final newContact = _contactController.text;

    try {
      await FirebaseFirestore.instance
          .collection('account') // Ensure this matches your collection name
          .doc(widget.docId)
          .update({
        'name': newName,
        'amount': newAmount,
        'contact': newContact,
      });
      Navigator.pop(context); // Close the screen after updating
    } catch (e) {
      print("Error updating document: $e"); // Log the error
    }
  }

  Future<void> _deleteData() async {
    try {
      await FirebaseFirestore.instance
          .collection('account') // Ensure this matches your collection name
          .doc(widget.docId)
          .delete();
      Navigator.pop(context); // Close the screen after deleting
    } catch (e) {
      print("Error deleting document: $e"); // Log the error
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name input field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Amount input field
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Contact input field
            TextFormField(
              controller: _contactController,
              decoration: const InputDecoration(
                labelText: "Contact",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Update button
            Center(
              child: ElevatedButton(
                onPressed: _updateData,
                child: const Text("Update"),
              ),
            ),
            const SizedBox(height: 20),
            // Delete button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () async {
                  // Confirm deletion
                  final confirmDelete = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm Delete", style: TextStyle(color: Colors.red),),
                        content: const Text("Are you sure you want to delete this account?", style: TextStyle(color: Colors.red),),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text("Cancel",style: TextStyle(color: Colors.red),),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text("Delete",style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      );
                    },
                  );

                  // If confirmed, call the delete function
                  if (confirmDelete == true) {
                    await _deleteData();
                  }
                },
                child: const Text("Delete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
