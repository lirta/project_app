import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/theme.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditEmail extends StatelessWidget {
  TextEditingController oldEmailController = TextEditingController(text: '');
  TextEditingController newEmailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleUpdateEmail() async {
      if (!(oldEmailController.text.trim() != "" &&
          newEmailController.text.trim() != "")) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'File tidak boleh kosong',
        ).show(context);
      } else if (!(oldEmailController.text == user.email)) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Email lama anda salah',
        ).show(context);
      } else if (!(newEmailController.text != user.email)) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Email lama dan Email baru anda sama',
        ).show(context);
      } else {
        if (await authProvider.editEmail(
            email: newEmailController.text, username: user.username)) {
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
          'Ganti Email',
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

    Widget oldEmail() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Lama',
              style: bTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: oldEmailController,
              style: bTextStyle,
              decoration: InputDecoration(
                hintText: 'Email Lama',
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

    Widget newEmail() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Baru',
              style: bTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: newEmailController,
              style: bTextStyle,
              decoration: InputDecoration(
                hintText: 'Email Baru',
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

    // ignore: non_constant_identifier_names
    Widget Update() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleUpdateEmail,
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
            oldEmail(),
            newEmail(),
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
