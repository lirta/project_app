// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/pages/member_title.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/provider/member_provider.dart';
import 'package:my_first/services/server.dart';
import 'package:my_first/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  // void initState() {
  //   _refreshMember();
  //   super.initState();
  // }

  Future<void> _refreshMember(BuildContext context) async {
    await Provider.of<MemberProvider>(context, listen: false).getMember();
  }

  @override
  // void initState() {
  //   refresh(context);
  //   super.initState();
  // }

  // ignore: missing_return
  // refresh(BuildContext context) async {
  //   await Future.delayed(Duration(seconds: 4));
  //   setState(() {
  //     Provider.of<MemberProvider>(context, listen: false).getMember();
  //     // MemberProvider memberProvider = Provider.of<MemberProvider>(context);
  //   });
  // }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    MemberProvider memberProvider = Provider.of<MemberProvider>(context);
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: wTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    '${user.username}',
                    style: wTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(gambarUrl + user.gambar)),
              ),
            ),
          ],
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Member',
          style: wTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: memberProvider.member
              .map(
                (member) => MemeberTitle(member),
              )
              .toList(),
        ),
      );
    }

    return RefreshIndicator(
      // onRefresh: refresh,
      onRefresh: () => _refreshMember(context),
      // () => _refreshMember(),
      child: Container(
        child: ListView(
          children: [
            header(),
            newArrivalsTitle(),
            newArrivals(),
          ],
        ),
      ),
    );
  }
}
