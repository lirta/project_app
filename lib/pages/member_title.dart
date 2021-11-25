import 'package:flutter/material.dart';
import 'package:my_first/model/member_model.dart';
import 'package:my_first/theme.dart';

class MemeberTitle extends StatelessWidget {
  final MemberModel member;
  MemeberTitle(this.member);

  @override
    Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ProductPage(product),
        //   ),
        // );
      },
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
              child: Image.asset('assets/image_profile.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,)
              // Image.network(
              //   product.galleries[0].url,
              //   width: 120,
              //   height: 120,
              //   fit: BoxFit.cover,
              // ),
            ),
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