
import 'package:flutter/material.dart';

class InfoMessageView extends StatelessWidget {
  
  const InfoMessageView({
    Key? key,
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = "eee";

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            backgroundColor: Colors.black45,
            radius: 42.0,
            child: Icon(
              Icons.info_outline,
              color: Colors.black,
              size: 52.0,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Error',
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
          SizedBox(height: 8.0),
           Text(
            "there is something issue while loading !",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          Text(''),
          _ActionButton(),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: TextButton(
        onPressed: (() {
          
        }),
        child: const Text(
          "Try again",
          // MessageProvider.of(context).tryAgain,
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
