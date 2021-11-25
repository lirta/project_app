// import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

class UserModel {
  int id;
  String name;
  String email;
  String username;
  File image;

  UserModel({this.id, this.name, this.username, this.email, this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'image': image,
    };
  }
}
