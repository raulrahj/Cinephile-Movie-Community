import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_box/data/models/messegemodel.dart';

const kRadius = 10.0;
const kPadding = 15.0;
const kHeight1 = SizedBox(
  height: 10.0,
);
const kHeight2 = SizedBox(height: 20);
const kHeight3 = SizedBox(
  height: 30,
);
const kHeight4 = SizedBox(
  height: 40,
);
const kWidth1 = SizedBox(
  width: 10,
);
const kWidth2 = SizedBox(
  width: 20,
);
const kWidth4 = SizedBox(
  width: 40,
);
const none = SizedBox();
const div = Divider(
  color: Colors.black54,
);
final kBorderRadius = BorderRadius.circular(kRadius);
dHeight(context) => MediaQuery.of(context).size.height;
dWidth(context) => MediaQuery.of(context).size.width;

List<Messege> chats = [
  Messege('Mac', '12:3', 'Hei', false),
  Messege('Me', '12:3', 'Hello', false),
  Messege('Mac', '12:4', 'Fine !', true),
  Messege('Mac', '12:5', 'How was the days', true),
  Messege('Me', '12:6', 'It\'s totaly greate :)', false),
];
String dateFormat(datetime) => DateFormat.MMMMEEEEd().format(datetime);
