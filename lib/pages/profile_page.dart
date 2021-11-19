import 'package:flutter/material.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/provider/auth_provider.dart';
import 'package:my_first/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/Logo3.png',
                    width: 70,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ${user.name}',
                        style: bTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        '${user.username}',
                        style: bTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${user.email}',
                        style: bTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: Image.asset(
                    'assets/exit.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: wTextStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: blueColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: wTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem(
                  'Edit Profile',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem(
                  'Edit Username',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem(
                  'Edit Email',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem(
                  'Edit Password',
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [header(), content()],
    );
  }
}
