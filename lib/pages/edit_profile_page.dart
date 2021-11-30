// import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/services/server.dart';
import 'package:my_first/theme.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController(text: '');
  File filegambar;
  final picker = ImagePicker();

  Future pilihGalery() async {
    // ignore: deprecated_member_use
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      filegambar = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    updateImage() async {
      if (filegambar == null) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Pilih file gambar',
        ).show(context);
      } else {
        var url = '$baseUrl' + 'InsertGambar.php';
        var uri = Uri.parse(url);
        var request = new http.MultipartRequest("POST", uri);
        var multipartFile =
            await http.MultipartFile.fromPath('filegambar', filegambar.path);
        request.files.add(multipartFile);
        request.fields['email'] = user.email;
        var response = await request.send();

        if (response.statusCode == 200) {
          // print(response);
          if (await authProvider.getUser(email: user.email)) {
            Navigator.pushNamed(context, '/home');
          } else {
            Flushbar(
              duration: Duration(seconds: 4),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: Color(0xffff5c83),
              message: 'Gagal mengambil data user',
            ).show(context);
          }
        } else {
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xffff5c83),
            message: 'Gagal Upload Foto Profile',
          ).show(context);
        }
      }
    }

    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: blueColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.check,
        //       color: primaryColor,
        //     ),
        //     onPressed: () {},
        //   )
        // ],
      );
    }

    // ignore: non_constant_identifier_names
    Widget Update() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: updateImage,
          style: TextButton.styleFrom(
              backgroundColor: blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text('Update', style: wTextStyle),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                pilihGalery();
              },
              child: Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  child: filegambar == null
                      ? Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    gambarUrl + user.gambar,
                                    // NetworkImage(
                                    //   'http://10.0.2.2/api/gambar/' + user.gambar,
                                  ))),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(filegambar),
                              )),
                        )),
            ),
            // nameInput(),
            // usernameInput(),
            Update()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
