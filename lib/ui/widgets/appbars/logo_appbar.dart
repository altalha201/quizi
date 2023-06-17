import 'package:flutter/material.dart';

AppBar logoAppbar() {
  return AppBar(
    flexibleSpace: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset("assets/images/banner-logo.png"),
        ),
      ),
    ),
  );
}
