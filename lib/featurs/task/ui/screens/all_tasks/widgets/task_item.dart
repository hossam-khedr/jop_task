import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:jop_task/core/app_colors.dart';
import 'package:jop_task/core/app_responsive.dart';
import 'package:jop_task/core/app_router/route_name.dart';
import 'package:jop_task/core/widgets/custom_menu.dart';
import 'package:jop_task/core/widgets/custom_text.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';

import '../../../../../../core/app_icons.dart';
import '../../../../../../core/app_stylse.dart';

class AllTasksItem extends StatelessWidget {
  final TaskModel model;
  const AllTasksItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(model.createdAt ?? '');
    String formattedDate = DateFormat('d/M/yyyy').format(dateTime);
    return ListTile(
      visualDensity: VisualDensity(horizontal: context.scaledWidth(-4)),
      leading: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, RouteName.taskDetails,arguments: model);
        },
        child: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(model.image ?? 'No Image'),
        ),
      ),
      title: Row(
          // spacing: context.scaledWidth(10),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomText(
                text: model.title ?? 'No title',
                overflow: TextOverflow.ellipsis,
                style: AppStyles.titleStyle().copyWith(fontSize: 16),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.scaledWidth(6),
                vertical: context.scaledHeight(2),
              ),
              decoration: BoxDecoration(
                  color: model.status == 'waiting'
                      ? AppColors.redLight
                      : model.status == 'Inprogress'
                          ? AppColors.primaryLight
                          : AppColors.bloLight,
                  borderRadius: BorderRadius.circular(5)),
              child: CustomText(
                  text: model.status ?? 'No Status',
                  style: AppStyles.taskItemStyle().copyWith(
                    color: model.status == 'waiting'
                      ? AppColors.error
                      : model.status == 'Inprogress'
                          ? AppColors.primary
                          : AppColors.blu,
                  )),
            ),
            const CustomMenu(),
          ]),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.scaledHeight(5),
        children: [
          CustomText(
            text: model.desc ?? 'No Descrebtion',
            style: AppStyles.hintStyle(),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: context.scaledWidth(5),
                children: [
                  SvgPicture.asset(
                    SvgIcons.smallFlag,
                    colorFilter: ColorFilter.mode(
                      model.priority == 'high'
                          ? AppColors.error
                          : model.priority == 'medium'
                              ? AppColors.primary
                              : AppColors.blu,
                      BlendMode.srcIn,
                    ),
                  ),
                  CustomText(
                    text: model.priority ?? 'No Priority',
                    style: AppStyles.prioritySmallTextStyle().copyWith(
                      color: model.priority == 'high'
                          ? AppColors.error
                          : model.priority == 'medium'
                              ? AppColors.primary
                              : AppColors.blu,
                    ),
                  )
                ],
              ),
              CustomText(
                text: formattedDate,
                style: AppStyles.hintStyle(),
              )
            ],
          )
        ],
      ),
    );
    //   Row(
    //   spacing: context.scaledWidth(12),
    //   children: [
    //     const CircleAvatar(
    //       radius: 30,
    //       backgroundImage: AssetImage('assets/images/logo.png'),
    //     ),
    //     Expanded(
    //       child: Column(
    //         spacing: context.scaledHeight(4),
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             spacing: context.scaledWidth(5),
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Expanded(
    //                 child: CustomText(
    //                   text: 'Task Title Task Title Task Title Task Title',
    //                   overflow: TextOverflow.ellipsis,
    //                   style: AppStyles.titleStyle().copyWith(fontSize: 16),
    //                 ),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.symmetric(
    //                   horizontal: context.scaledWidth(6),
    //                   vertical: context.scaledHeight(2),
    //                 ),
    //                 decoration: BoxDecoration(
    //                     color: AppColors.redLight,
    //                     borderRadius: BorderRadius.circular(5)),
    //                 child: CustomText(
    //                     text: 'Task Status', style: AppStyles.taskItemStyle()),
    //               ),
    //               menuWidget(context),
    //             ],
    //           ),
    //           CustomText(
    //             text: 'Descrebtion Descrebtion Descrebtion Descrebtion Descrebtion',
    //             style: AppStyles.hintStyle(),
    //             overflow: TextOverflow.ellipsis,
    //
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Row(
    //                 spacing: context.scaledWidth(5),
    //                 children: [
    //                   SvgPicture.asset(SvgIcons.smallFlag),
    //                   CustomText(
    //                     text: 'Priority',
    //                     style: AppStyles.prioritySmallTextStyle()
    //                         .copyWith(color: AppColors.primary),
    //                   )
    //                 ],
    //               ),
    //               CustomText(text: '1-1-2024', style: AppStyles.hintStyle())
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }

  // Widget menuWidget(BuildContext context) {
  //   return PopupMenuButton<int>(
  //     onSelected: (value) {
  //       if (value == 1) {
  //         // add the logic for value 1
  //       }
  //       if (value == 2) {
  //         // add the logic for value 3
  //       }
  //     },
  //     offset: const Offset(-25, 35),
  //     color: AppColors.whit,
  //     constraints: BoxConstraints(
  //       minHeight: context.scaledHeight(88),
  //       maxWidth: context.scaledWidth(82),
  //     ),
  //     menuPadding: EdgeInsets.symmetric(horizontal: context.scaledWidth(5)),
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //       bottomRight: Radius.circular(12),
  //       bottomLeft: Radius.circular(12),
  //       topLeft: Radius.circular(12),
  //     )),
  //     itemBuilder: (context) => [
  //       PopupMenuItem(
  //         value: 1,
  //         child: CustomText(
  //           text: 'Edit',
  //           style: AppStyles.titleStyle().copyWith(fontSize: 14),
  //         ),
  //       ),
  //       const PopupMenuDivider(),
  //       PopupMenuItem(
  //         value: 2,
  //         child: CustomText(
  //           text: 'Delete',
  //           style: AppStyles.errorStyle().copyWith(fontSize: 14),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
