import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final String time;

  const MessageCard({Key? key, required this.message, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Color(0xffdcf8c6),
          child: Stack(
            children: [
              Padding(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
                padding: EdgeInsets.fromLTRB(10, 10, 60, 20),
              ),
              Positioned(
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                right: 10,
                bottom: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
