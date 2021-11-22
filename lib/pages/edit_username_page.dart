import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/theme.dart';
import 'package:provider/provider.dart';

class EditUsername extends StatelessWidget {
  TextEditingController oldUsernameController = TextEditingController(text: '');
  TextEditingController newUsernameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleUpdateUsername() async {
      if (!(oldUsernameController.text.trim() != "" &&
          newUsernameController.text.trim() != "")) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'fild tidak boleh kosong',
        ).show(context);
      } else if (!(oldUsernameController.text == user.username)) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'username lama anda salah',
        ).show(context);
      } else if (!(newUsernameController.text != user.username)) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'username lama dan username baru anda sama',
        ).show(context);
      } else {
        if (await authProvider.editUsername(
            username: newUsernameController.text, email: user.email)) {
          Navigator.pushNamed(context, '/profile');
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
          'Ganti Username',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {},
          )
        ],
      );
    }

    Widget oldUsername() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username Lama',
              style: bTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: oldUsernameController,
              style: bTextStyle,
              decoration: InputDecoration(
                hintText: 'Username Lama',
                hintStyle: wTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blueColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget newUsername() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username Baru',
              style: bTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: newUsernameController,
              style: bTextStyle,
              decoration: InputDecoration(
                hintText: 'Username Baru',
                hintStyle: wTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blueColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget Update() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleUpdateUsername,
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
            oldUsername(),
            newUsername(),
            // usernameConfirmation(),
            Update(),
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
