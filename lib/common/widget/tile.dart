import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_link_saver/model/video_detail_model.dart';
import '../const/app_colors.dart';

class Tile extends StatelessWidget {
  final VideoDetail videoRecord;

  const Tile({
    super.key,
    required this.videoRecord,
  });

  @override
  build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          // onTap: () => launchVideoUrl(videoRecord.url),
          child: Container(
            height: 110.h,
            width: 354.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: AppColor.mainColor,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                children: [
                  Text(
                    videoRecord.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    videoRecord.descriotion,
                    maxLines: 3,
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.video_settings,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        videoRecord.url.substring(0, 41),
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                        style: TextStyle(
                          color: AppColor.mainColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
