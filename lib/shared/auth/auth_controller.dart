import 'package:flutter/material.dart';

import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(UserModel? user, context) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/home',arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user.toJson());
    return;
  }

  Future<void> hasUser(context) async {
    final prefs = await SharedPreferences.getInstance();
    await 
    Future.delayed(Duration(seconds: 3));
    if (prefs.containsKey('user')) {
      final json = prefs.get('user') as String;
      setUser(UserModel.fromJson(json),context);

      return;
    } else {
      setUser(null, context);
    }
  }
}
