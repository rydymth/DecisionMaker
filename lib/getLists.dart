import 'package:flutter/material.dart';

class decisionList extends StatefulWidget {
  const decisionList({required this.ls, super.key});

  final List<String> ls;

  @override
  State<decisionList> createState() => _decisionListState();
}

class _decisionListState extends State<decisionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.ls.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.ls[index], style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                  ]
                ),
              ]
            )
          ),
        );
      }
    );
  }
}