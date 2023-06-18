import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/teacher_profile_model.dart';
import '../../controllers/cache_controller.dart';
import '../../utility/colors.dart';
import '../../utility/other_utils.dart';
import 'avatar_card.dart';

class TeacherProfileCard extends StatelessWidget {
  const TeacherProfileCard({
    Key? key,
    this.teacher,
  }) : super(key: key);

  final TeacherProfileModel? teacher;

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
                imageURL: teacher?.imgUrl ?? defaultProfileImg,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            teacher?.userName ?? "User Name",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            teacher?.email ?? "Email",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45),
                          )
                        ],
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            Get.find<CacheController>().logout();
                          },
                          icon: const Icon(
                            Icons.logout_sharp,
                            size: 24,
                            color: colorPrimary,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Quiz Created",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            (teacher?.noOfQuizzes ?? 0).toString(),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w400,
                              color: colorPrimary,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 1,
                        color: colorPrimary.withOpacity(0.3),
                      ),
                      Column(
                        children: [
                          const Text(
                            "Participants",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            (teacher?.participants ?? 0).toString(),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w400,
                              color: colorPrimary,
                            ),
                          )
                        ],
                      )
                    ],
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
