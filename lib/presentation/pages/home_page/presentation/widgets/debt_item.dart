import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:debt_example/config/constants/app_colors.dart';
import 'package:debt_example/config/constants/app_decorations.dart';
import 'package:debt_example/config/constants/app_text_styles.dart';
import 'package:debt_example/presentation/pages/home_page/data/models/debt_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DebtListItemWidget extends StatelessWidget {
  const DebtListItemWidget({
    super.key,
    required this.size,
    required this.model,
  });

  final Size size;
  final DebtModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 31.h),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: AppColors.shadowColor,
          blurRadius: 18,
          spreadRadius: 0,
        ),
      ], color: AppColors.white, borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width / 3.5,
              minWidth: size.width / 3.5,
            ),
            child: CachedNetworkImage(
              imageUrl: '${model.imageUrl}',
              placeholder: (context, url) => const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.greenColor)),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: AppColors.greyColor.withOpacity(0.4),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 23.w, left: 20.w),
              width: 2.w,
              color: AppColors.bgColor),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.sumOne}',
                  style: AppTextStyles.head25w9.copyWith(
                    color: AppColors.primaryTextColor,
                    fontSize: 18.sp,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Ставка от ',
                        style: AppTextStyles.head12w4,
                      ),
                      TextSpan(
                        text: '${model.percent}',
                        style: AppTextStyles.head12w4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                    onPressed: () async {
                      if (await canLaunch('${model.url}')) {
                        await launch(
                          '${model.url}',
                          forceSafariVC: false,
                          forceWebView: true,
                          enableJavaScript: true,
                        );
                      }
                    },
                    style: AppDecorations.buttonStyle(),
                    child: AutoSizeText(
                      'Получить Деньги',
                      maxLines: 1,
                      minFontSize: 10,
                      style: AppTextStyles.head16w5,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
