// import 'package:flutter/material.dart';

// import 'dart:convert';
// import 'dart:io';

class UserModel {
  int id;
  String name;
  String email;
  String username;
  String gambar;

  UserModel({this.id, this.name, this.username, this.email, this.gambar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'gambar': gambar,
    };
  }
}
