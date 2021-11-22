import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/theme.dart';
import 'package:provider/provider.dart';

class EditPasswordPage extends StatelessWidget {
  TextEditingController oldController = TextEditingController(text: '');
  TextEditingController newController = TextEditingController(text: '');
  TextEditingController comfirController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleUpdatePassword() async{
      if (!(oldController.text.trim() != "" &&
                newController.text.trim() != "" &&
                comfirController.text.trim() != "")) {
              Flushbar(
                duration: Duration(milliseconds: 1500),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Color(0xffff5c83),
                message: 'fild tidak boleh kosong',
              ).show(context);
            } else if (!(newController.text.length >= 6)) {
              Flushbar(
                duration: Duration(milliseconds: 1500),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Color(0xffff5c83),
                message: 'Password minimal 6 character',
              ).show(context);
            } else if (!(newController.text == comfirController.text)) {
              Flushbar(
                duration: Duration(milliseconds: 1500),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Color(0xffff5c83),
                message: 'Password baru & password confirmation harus sama',
              ).show(context);
            }else{
                  Flushbar(
                duration: Duration(milliseconds: 1500),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Color(0xffff5c83),
                message: 'error',
              ).show(context);
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
          'Edit Password',
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

    Widget passwordOld() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password Lama',
              style: bTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: oldController,
              style: bTextStyle,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password Lama',
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

    Widget passwordNew() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password Baru',
              style: bTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: newController,
              style: bTextStyle,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password Baru',
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

    Widget passwordConfirmation() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password Confirmation',
              style: bTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              controller: comfirController,
              style: bTextStyle,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password confirmation',
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
          onPressed: handleUpdatePassword,
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
            // Container(
            //   width: 100,
            //   height: 100,
            //   margin: EdgeInsets.only(
            //     top: defaultMargin,
            //   ),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       fit: BoxFit.fill,
            //       // image: NetworkImage(
            //       //   user.profilePhotoUrl,
            //       // ),
            //     ),
            //   ),
            // ),
            passwordOld(),
            passwordNew(),
            passwordConfirmation(),
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
