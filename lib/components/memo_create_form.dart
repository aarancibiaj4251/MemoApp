import 'package:flutter/material.dart';

import 'package:hive_ce/hive_ce.dart';
import 'package:nihongo_memo/models/memo.dart';
import 'package:nihongo_memo/utils/constants.dart';
import 'package:nihongo_memo/utils/helpers.dart';

class MemoCreateForm extends StatefulWidget {
  const MemoCreateForm({super.key});

  @override
  State<MemoCreateForm> createState() => _MemoCreateFormState();
}

class _MemoCreateFormState extends State<MemoCreateForm> {
  final _formKey = GlobalKey<FormState>();

  _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  onPressed() async{
    Navigator.of(context).pop();

    var state = _formKey.currentState;

    if (state!.validate()) {
      
      var first = state.fields.first;

      var memo = Memo(id: createUUID(), name: first.value);

      final memoBox = Hive.box(MEMO_ENTITY);
      memoBox.put(memo.id, memo);
      
      Navigator.pushNamed(context, '/directory', arguments: memo);

      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
                autofocus: true,
                maxLength: 15,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'メモを入力ください',
              ),
              validator: (e) => _validator(e),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('保存する'),
            ),
        ],
      ),
    );
  }
}