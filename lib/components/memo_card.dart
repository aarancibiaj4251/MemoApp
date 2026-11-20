import 'package:flutter/material.dart';
import 'package:nihongo_memo/models/memo.dart';

class MemoCard extends StatelessWidget {
  final Memo memo;
  const MemoCard({super.key, required this.memo});

  @override
  Widget build(BuildContext context) {
    
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
                            ),
                          ),
                        ),
                  ],
                );
  }
}