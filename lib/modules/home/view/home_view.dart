import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_link_saver/modules/home/view_model/home_view_model.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/widget/bottom_sheet.dart';
import '../../../common/widget/custom_button.dart';
import '../../../common/widget/tile.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController urlController = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    final videoList = ref.watch(homeViewModelProvider);
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: videoList.isEmpty
          ? const Center(
              child: Text(
                'No Link Added',
                style: TextStyle(color: AppColor.mainColor),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: videoList.length,
                    itemBuilder: (context, index) {
                      final video = videoList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Tile(
                          videoRecord: video,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Container(
        color: AppColor.backGroundColor,
        height: 70.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Button(
          isIcon: true,
          ontap: () async {
            await showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                urlController.text = '';
                return dialog(context, urlController, ref);
              },
            );
          },
        ),
      ),
    );
  }
}
