import 'package:flutter/material.dart';
import 'package:my_first/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/Logo2.png',
                  width: 60,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inda',
                    style: wTextStyle.copyWith(fontSize: 24),
                  )
                ],
              ))
            ],
          ),
        )),
      );
    }

    Widget conten() {
      return Expanded(
          child: Container(
        // padding: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        decoration: BoxDecoration(color: whiteColor),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'inda lirta padisma',
              style: bTextStyle.copyWith(fontSize: 24),
            ),
            Text(
              'indalirta@gmai.com',
              style: bTextStyle.copyWith(fontSize: 24),
            ),
            Text(
              '0888888888',
              style: bTextStyle.copyWith(fontSize: 24),
            ),
          ],
        ),
      ));
    }

    Widget edit() {
      return Expanded(
          child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
      ));
    }

    return Column(
      children: [header(), conten(), edit()],
    );
  }
}
