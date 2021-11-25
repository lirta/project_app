import 'package:flutter/material.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/pages/member_title.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/provider/member_provider.dart';
// import 'package:my_first/provider/member_provider.dart';
import 'package:my_first/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
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
                  image: AssetImage('assets/image_profile.png'),
                  //  NetworkImage(
                  //   user.profilePhotoUrl,
                  // ),
                ),
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
            children: 
            memberProvider.member
                .map(
                  (member) =>MemeberTitle (member),
                )
                .toList(),
            // MemeberTitle(),
            // MemeberTitle(),
            // MemeberTitle(),
            // MemeberTitle(),
            // MemeberTitle(),
            // MemeberTitle(),
            // MemeberTitle(),
            // MemeberTitle(),
            
            ),
      );
    }

    return Container(
      child: ListView(
        children: [
          header(),
          newArrivalsTitle(),
          newArrivals(),
        ],
      ),
    );
  }
}