import 'package:bs_educativo/utility/demoInfos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utility/colors.dart';
import '../../utility/text_widgets.dart';
import '../../utility/widgets.dart';


class DocumentListView extends StatefulWidget {
  final Function(int) onScreenChange;
  const DocumentListView({super.key, required this.onScreenChange});

  @override
  State<DocumentListView> createState() => _DocumentListViewState();
}

class _DocumentListViewState extends State<DocumentListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.white,
          border: Border.all(color: AppColors.blueBa,width: 2.5.r)
      ),
      child: Column(children: [
        Container(width: double.infinity,height: 65.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColors.bgDc,
              borderRadius: BorderRadius.circular(6.r),
              border: Border(bottom: BorderSide(color: AppColors.border,width: 1.5.r)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 5))
              ]
          ),
          child: Row(children: [
            txtR("Materia",15.sp,weight: FontWeight.w600),
            Spacer(),
            txtR("Promedio",15.sp,weight: FontWeight.w600),
          ]),
        ),
        gapH(10.h),
        Expanded(
          child:
          ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 16.h),
              itemCount:documents.length,
              itemBuilder: (context, index) {
                final doc = documents?[index];
                return GestureDetector(onTap: (){
                  widget.onScreenChange(1);
                },
                  child: documentAndDates(
                      title:doc?.title??"",
                      date: doc?.date.toString()??""),
                );
              }
          ),
        ),

      ],),
    );
  }
}
