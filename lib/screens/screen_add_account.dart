import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khata_app/class_model_customer.dart';

class ScreenAddAccount extends StatefulWidget {
  const ScreenAddAccount({super.key});

  @override
  State<ScreenAddAccount> createState() => _ScreenAddAccountState();
}

class _ScreenAddAccountState extends State<ScreenAddAccount> {
  var firestoreInstance = FirebaseFirestore.instance;

  var controllerName = TextEditingController();
  var controllerContact = TextEditingController();
  var controllerAmmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Account"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              TextFormField(
                controller: controllerName,
                decoration: const InputDecoration(hintText: "Enter Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerContact,
                decoration: const InputDecoration(
                  hintText: "Contact",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerAmmount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Ammount",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  CollectionReference users =
                      firestoreInstance.collection("account");
                  DocumentReference docRef = users.doc();
                  ModelCustomer model = ModelCustomer(
                      docId: docRef.id,
                      name: controllerName.text,
                      contact: controllerContact.text,
                      amount: controllerAmmount.text);
                  users.doc(docRef.id).set(model.toJson());
                  Navigator.pop(context);
                },
                child: const Text("Add Account"),
              )
            ],
          ),
        ));
  }
}
