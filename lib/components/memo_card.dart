import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:nihongo_memo/models/memo.dart';
import 'package:nihongo_memo/utils/constants.dart';

class MemoCard extends StatelessWidget {
  final String memoId;
  const MemoCard({super.key, required this.memoId});

  @override
  Widget build(BuildContext context) {

    final memoBox = Hive.box(MEMO_ENTITY);
    final memo = memoBox.get(memoId) as Memo;
    
    return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                            memo.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.memory(
                              memo.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image(image: AssetImage('assets/img/no_image_available.png'));
                              },
                            ),
                          ),
                        ),
                  ],
                );
  }
}