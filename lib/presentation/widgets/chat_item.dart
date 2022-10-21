import 'package:flutter/material.dart';

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
    required this.massage,
    this.hasRead = false,
  }) : super(key: key);
  final bool isSender;
  final bool hasRead;
  final String massage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      // color: Colors.black26,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: isSender ? Colors.green[300] : Colors.black26,
                borderRadius: isSender
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
            padding: const EdgeInsets.all(15),
            child: Text(massage),
          ),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              isSender
                  ? Icon(Icons.check_circle_outline,
                      size: 20,
                      color: hasRead ? Colors.blueAccent : Colors.black45)
                  : const Text(""),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "10.15 PM",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
