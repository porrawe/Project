// ignore_for_file: must_be_immutable

import 'package:account/main.dart';
import 'package:account/models/transactions.dart';
import 'package:account/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  Transactions statement;

  EditScreen({super.key, required this.statement});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  final nameController = TextEditingController();

  final loController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.statement.title;
    nameController.text = widget.statement.name;
    loController.text = widget.statement.name;
    return Scaffold(
        appBar: AppBar(
          title: const Text('แบบฟอร์มแก้ไขข้อมูล'),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อรายการ',
                  ),
                  autofocus: false,
                  controller: titleController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อสนาม',
                  ),
                  controller: nameController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ที่ตั้ง',
                  ),
                  controller: loController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    return null;
                  },
                ),
                TextButton(
                    child: const Text('แก้ไขข้อมูล'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // create transaction data object
                        var statement = Transactions(
                            keyID: widget.statement.keyID,
                            title: titleController.text,
                            name: nameController.text,
                            lo: loController.text,
                            date: DateTime.now());

                        // add transaction data object to provider
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);

                        provider.updateTransaction(statement);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return MyHomePage();
                                }));
                      }
                    })
              ],
            )));
  }
}
