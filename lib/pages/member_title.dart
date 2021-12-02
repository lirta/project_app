import 'package:flutter/material.dart';
import 'package:my_first/model/member_model.dart';
import 'package:my_first/theme.dart';
import 'package:my_first/services/server.dart';

// ignore: must_be_immutable
class MemeberTitle extends StatelessWidget {
  MemberModel member;
  MemeberTitle(this.member);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  gambarUrl + member.gambar,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   // member.name,
                  //   'inda',
                  //   style: wTextStyle.copyWith(
                  //     fontSize: 12,
                  //   ),
                  // ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    member.name,
                    // 'lirta',
                    style: wTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  // Text(
                  //   member.username,
                  //   // 'Lierta',
                  //   style: wTextStyle.copyWith(
                  //     fontWeight: FontWeight.normal,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
