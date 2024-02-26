import 'package:course_bank_sha/model/tip_model.dart';
import 'package:course_bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeTipsItem extends StatelessWidget {
  final TipsModel tips;
  const HomeTipsItem({
    super.key,
    required this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrlString(tips.url.toString())) {
          launchUrlString(tips.url.toString());
        }
      },
      child: Container(
        width: 155,
        height: 176,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                tips.thumbnail.toString(),
                width: 155,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                tips.title.toString(),
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
