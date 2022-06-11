import 'package:flutter/material.dart';

Widget close(context) {
  return IconButton(
      onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close));
}

Widget pop(context) {
  return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios));
}
