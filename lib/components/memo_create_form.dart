import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive_ce/hive_ce.dart';

import 'package:nihongo_memo/models/memo.dart';
import 'package:nihongo_memo/utils/constants.dart';
import 'package:nihongo_memo/utils/helpers.dart';

class MemoCreateForm extends StatefulWidget {
  const MemoCreateForm({super.key, dynamic file});
  final dynamic file = null;

  @override
  State<MemoCreateForm> createState() => _MemoCreateFormState();
}

class _MemoCreateFormState extends State<MemoCreateForm> {
  final _formKey = GlobalKey<FormState>();
  late PlatformFile? file;

  @override
  void initState() {
    super.initState();
    file = widget.file;
  }

  _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'メモを入力してください';
    }
    return null;
  }

  void onPressed() async {
    Navigator.of(context).pop();

    var state = _formKey.currentState;

    if (state!.validate()) {
      
      var first = state.fields.first;

      
      var memo = Memo(id: createUUID(), name: first.value, color: randomColor());
      if (file != null) {
        var bytesFile = await file!.readAsBytes();
        memo.image = bytesFile;
      }

      final memoBox = Hive.box(MEMO_ENTITY);
      await memoBox.put(memo.id, memo);
      memoBox.flush();
      
      Navigator.pushNamed(context, '/directory', arguments: memo.id);

      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('')),
      // );
    }
  }

  Widget validateFile() {
    if (file != null) {
      return Text('File name: ${file?.name}');
    }
    return Text("");
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
                maxLength: 20,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'メモを入力ください',
              ),
              validator: (e) => _validator(e),
            ),
          OutlinedButton(
            onPressed: () async {
                        var choosenFile = await FilePicker.pickFile(
                          type: FileType.image,
                          allowedExtensions: ['jpeg', 'png'],
                        );
                        if (choosenFile != null) {
                          setState(() {
                            file = choosenFile;
                          });
                        }
                      },
            child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    IconButton(
                      icon: Icon(Icons.upload),
                      onPressed: () => {},
                    ),
                    Text("イメージを検索する"),
                  ],
                ),
          ),
          validateFile(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text('保存する'),
            ),
          ),
        ],
      ),
    );
  }
}