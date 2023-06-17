import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/student_profile_model.dart';
import '../../controllers/cache_controller.dart';
import '../../utility/colors.dart';
import '../../utility/other_utils.dart';
import 'avatar_card.dart';

class StudentProfileCard extends StatelessWidget {
  const StudentProfileCard({
    Key? key,
    this.student,
  }) : super(key: key);

  final StudentProfileModel? student;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(
            color: colorPrimary,
          )),
      shadowColor: colorPrimary.withOpacity(0.2),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: colorPrimary,
              child: AvatarCard(
                imageURL: student?.imgUrl ?? defaultProfileImg,
                radius: 59,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student?.userName ?? "User Name",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            student?.email ?? "Email",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Get.find<CacheController>().logout();
                        },
                        icon: const Icon(
                          Icons.logout_sharp,
                          size: 24,
                          color: colorPrimary,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "${student?.points ?? 0} / ${student?.totalPoints ?? 0}",
                    style: const TextStyle(
                      color: colorPrimary
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  LinearProgressIndicator(
                    backgroundColor: colorPrimary.withOpacity(0.3),
                    value: (student?.points ?? 0) /
                        ((student?.totalPoints == 0
                                ? 1
                                : student!.totalPoints) ??
                            1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
