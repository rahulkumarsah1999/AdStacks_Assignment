import 'package:flutter/material.dart';

class PeopleEventModel {
  final String title;
  final int total;
  final int avatarCount;
  final String buttonLabel;
  final Color buttonColor;
  final Color avatarColor;

  const PeopleEventModel({
    required this.title,
    required this.total,
    required this.avatarCount,
    required this.buttonLabel,
    required this.buttonColor,
    required this.avatarColor,
  });
}
