import 'package:flutter/material.dart';

class StepItemModel {
  final Widget? title;
  final Widget? subtitle1;
  final Widget? subtitle2;
  final Widget? contents;

  StepItemModel({
    this.title,
    this.subtitle1,
    this.subtitle2,
    this.contents,
  }) {
    validate();
  }

  void validate() {
    if (title == null && contents == null) {
      throw ArgumentError('Either title or contents must be provided.');
    }
  }
}
