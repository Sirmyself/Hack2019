import 'dart:collection';

import 'package:flutter/material.dart';
import '../Activity/User.dart';

class TestUser {

  static User _user;

  TestUser() {}

  User getUser() {
    if (_user == null) {
      _user = new User("Tommy","Beaulieu");
    }

    return _user;
  }
}