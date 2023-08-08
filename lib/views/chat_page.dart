import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_chat_ui/views/widgets/message_card.dart';
import 'package:whatsapp_chat_ui/views/widgets/reply_message_card.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' as foundation;

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var width, height;
  TextEditingController messageController = new TextEditingController();
  bool sendButton = false, showEmoji = false;
  List<String> messages = [];
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          showEmoji = false;
        });
      },
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            if (showEmoji) {
              setState(() {
                showEmoji = !showEmoji;
              });
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: Scaffold(
            backgroundColor: Color.fromRGBO(188, 176, 176, 0.3843137254901961),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                backgroundColor: Color(0xFF075E54),
                leadingWidth: 70,
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                title: Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Rajshree Pindolia Flutter Internship',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                titleSpacing: 0,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.white,
                      )),
                  IconButton(
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  PopupMenuButton<String>(
                    padding: EdgeInsets.all(0),
                    onSelected: (value) {
                      print(value);
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text(
                            'View Contact',
                          ),
                          value: 'View Contact',
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Media, links and docs',
                          ),
                          value: 'Media, links and docs',
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Whatsapp Web',
                          ),
                          value: 'Whatsapp Web',
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Search',
                          ),
                          value: 'Search',
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Mute Notifications',
                          ),
                          value: 'Mute Notifications',
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Wallpaper',
                          ),
                          value: 'Wallpaper',
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
            body: Container(
              width: width,
              height: height,
              child: Stack(
                children: [
                  ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(205, 238, 230, 1),
                            ),
                            child: Text(
                              'Today',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 242, 111, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: RichText(
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              text: TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.lock,
                                  size: 12,
                                  color: Colors.black54,
                                )),
                                TextSpan(
                                  text:
                                      ' Messages and calls are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them. Tap to learn more.',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.black12,
                            ),
                            child: Text(
                              '1 Unread Message',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ReplyMessageCard(
                        message: 'Hello',
                        time: getCurrentTime(),
                      ),
                      MessageCard(
                        message: 'Hello',
                        time: getCurrentTime(),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return MessageCard(
                              message: messages[index], time: getCurrentTime());
                        },
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width - 60,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            showEmoji = !showEmoji;
                                          });
                                        },
                                        icon: Icon(Icons.emoji_emotions)),
                                    Expanded(
                                      child: TextFormField(
                                        controller: messageController,
                                        focusNode: focusNode,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                                        onTap: () {
                                          if (showEmoji) {
                                            setState(() {
                                              showEmoji = !showEmoji;
                                            });
                                          }
                                        },
                                        onChanged: (value) {
                                          if (value.length > 0) {
                                            setState(() {
                                              sendButton = true;
                                            });
                                          } else {
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Message',
                                          isDense: true,
                                          border: InputBorder.none,
                                          suffix: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [],
                                          ),
                                          contentPadding: EdgeInsets.all(5),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (builder) =>
                                                  bottomSheet());
                                        },
                                        icon: Icon(
                                          Icons.attach_file_sharp,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.currency_rupee,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.camera_alt,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 8.0, left: 2, right: 5),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xFF128C7E),
                                child: IconButton(
                                  onPressed: () {
                                    if (sendButton) {
                                      if (messageController.text.isNotEmpty) {
                                        setState(() {
                                          messages.add(messageController.text);
                                          messageController.clear();
                                          print(messages.length);
                                          sendButton = false;
                                        });
                                      } else {
                                        focusNode.requestFocus();
                                      }
                                    }
                                  },
                                  icon: Icon(
                                    sendButton ? Icons.send : Icons.mic,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        showEmoji
                            ? SizedBox(
                                width: width,
                                height: 250,
                                child: EmojiPicker(
                                  textEditingController: messageController,
                                  config: Config(
                                    bgColor: Colors.white,
                                    columns: 8,
                                    emojiSizeMax: 32 *
                                        (foundation.defaultTargetPlatform ==
                                                TargetPlatform.iOS
                                            ? 1.30
                                            : 1),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, 'Document'),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, 'Camera'),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, 'Gallery'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, 'Audio'),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, 'Location'),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, 'Contact'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
            size: 29,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(text),
      ],
    );
  }

  String getCurrentTime() {
    String currentTime = DateFormat('hh:mm a').format(DateTime.now());
    return currentTime;
  }
}
