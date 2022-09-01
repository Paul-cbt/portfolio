import 'package:flutter/material.dart';

double getMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width > 800
      ? 800
      : MediaQuery.of(context).size.width;
}
