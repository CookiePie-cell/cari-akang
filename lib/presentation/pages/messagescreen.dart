import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/chat_item.dart';

class ChatRoomView extends StatefulWidget {
  const ChatRoomView({Key? key}) : super(key: key);

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  final List<ItemChat> messages = [
    const ItemChat(
      isSender: true,
      hasRead: true,
      massage: "halo kakak cantik",
    ),
    const ItemChat(
      isSender: false,
      massage: "halo juga kak",
    ),
    const ItemChat(
      isSender: true,
      hasRead: true,
      massage: "Apakah Kau tau orang hilang ini ?",
    ),
    const ItemChat(
      isSender: false,
      massage: "Iya, tau kak, Kemarin saya lihat di sedang jalan di mall",
    ),
    const ItemChat(
      isSender: true,
      hasRead: true,
      massage: "TerimaKasih kak atas petunjuknya",
    ),
    const ItemChat(
      isSender: false,
      massage: "Iya, sama-sama kak",
    ),
    const ItemChat(
      isSender: true,
      hasRead: false,
      massage: "Okok",
    )
  ];

  late TextEditingController _textEditingController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(width: 5),
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.black54,
                backgroundImage: NetworkImage(
                    "https://wallpapersmug.com/download/1024x768/c49619/brunette-woman-outdoor-autumn.jpg"),
              )
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text(
              'User Cantik',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              'Online',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ItemChat(
                  isSender: messages[index].isSender,
                  massage: messages[index].massage);
            },
          )),
          Container(
            // margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        hintText: "massage . . . ",
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                ),
                const SizedBox(width: 10),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.green[500],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                        onPressed: () {
                          log(_textEditingController.text);
                          setState(() {
                            messages.add(ItemChat(
                              isSender: true,
                              massage: _textEditingController.text,
                            ));
                          });
                          _textEditingController.clear();

                          scrollToBottom();
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void scrollToBottom() {
    final bottomOffset = _scrollController.position.maxScrollExtent * 2;
    log(bottomOffset.toString());
    _scrollController.animateTo(
      bottomOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
