import 'package:cached_network_image/cached_network_image.dart';
import 'package:expression_de_besoins_convers/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class ImageUtils {
  static final ImageUtils _imageUtils = ImageUtils();

  static ImageUtils get imageUtilsInstance => _imageUtils;

  // Image picker

  Widget showCacheNetworkImage(
      {required String imageURL,
      String placeHolderImage = "",
      Icon? icon,
      double placeholderPadding = 0,
      BoxShape shape = BoxShape.rectangle,
      double height = double.maxFinite,
      double width = double.maxFinite,
      BoxFit fit = BoxFit.cover,
      Color? placeholderColor,
      bool showProgressBarInPlaceHolder = false,
      bool showDefaultErrorWidget = false}) {
    return CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageURL,
        imageBuilder: (context, imageProvider) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: shape,
                color: Colors.transparent,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        fit: fit,
        placeholder: (context, url) {
          return (showProgressBarInPlaceHolder == true)
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Padding(
                    padding: EdgeInsets.all(placeholderPadding),
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: (placeholderColor == null)
                          ? showSVGImage(
                              placeHolderImage,
                              height: height,
                              width: width,
                              fit: fit,
                            )
                          : showSVGIcons(
                              placeHolderImage,
                              height: height,
                              width: width,
                              fit: fit,
                              color: placeholderColor,
                            ),
                    ),
                  ),
                );
        },
        errorWidget: (context, url, error) {
          return (showDefaultErrorWidget == true)
              ? const Icon(
                  Icons.error,
                )
              : (icon != null)
                  ? Padding(
                      padding: EdgeInsets.all(placeholderPadding),
                      child: icon,
                    )
                  : Padding(
                      padding: EdgeInsets.all(placeholderPadding),
                      child: (placeholderColor == null)
                          ? Center(
                              child: showSVGImage(
                                placeHolderImage,
                                height: height,
                                width: width,
                                fit: fit,
                              ),
                            )
                          : Center(
                              child: showSVGIcons(
                                placeHolderImage,
                                height: height,
                                width: width,
                                fit: fit,
                                color: placeholderColor,
                              ),
                            ),
                    );
        });
  }

  Widget showNetworksvgImage(
      {required String imageURL,
      String placeHolderImage = "",
      Icon? icon,
      double placeholderPadding = 0,
      BoxShape shape = BoxShape.rectangle,
      double height = double.maxFinite,
      double width = double.maxFinite,
      BoxFit fit = BoxFit.cover,
      Color? imagecolor = Colors.blue,
      bool showProgressBarInPlaceHolder = false,
      bool showDefaultErrorWidget = false}) {
    return SvgPicture.network(
      imageURL,
      fit: fit,
      color: imagecolor,
      height: height.h,
      width: height.h,
      placeholderBuilder: (BuildContext context) => Center(
        child: SizedBox(
            height: 0.025.sh,
            width: 0.025.sw,
            child: CircularProgressIndicator(
              color: imagecolor,
              strokeWidth: 2.5 / 2.5,
            )),
      ),
    );
  }

  Widget showSVGIcons(
    String image, {
    double padding = 0,
    double height = 25,
    double width = 25,
    double progressIndicatorSize = 5,
    Color? color,
    Color progressIndicatorColor = AppColors.colorPrimary,
    bool ofWidth = false,
    bool staticDim = false,
    BoxFit fit = BoxFit.contain,
    bool showProgressIndicator = false,
  }) {
    return Padding(
      padding: EdgeInsets.all(
        padding,
      ),
      child: SvgPicture.asset(
        image,
        fit: fit,
        color: color ?? AppColors.colorPrimary,
        height: (staticDim) ? height : height.h,
        width: (staticDim) ? width : width.h,
        placeholderBuilder: (BuildContext context) => (showProgressIndicator)
            ? SizedBox(
                height: progressIndicatorSize.h,
                width: progressIndicatorSize.h,
                child: CircularProgressIndicator(
                  color: progressIndicatorColor,
                  strokeWidth: progressIndicatorSize / 2.5,
                ))
            : const SizedBox(),
      ),
    );
  }

  Widget showSVGIcon(
    String image, {
    double padding = 0,
    double height = 25,
    double width = 25,
    double progressIndicatorSize = 5,
    Color? color,
    Color progressIndicatorColor = AppColors.colorPrimary,
    bool ofWidth = false,
    bool staticDim = false,
    BoxFit fit = BoxFit.contain,
    bool showProgressIndicator = false,
  }) {
    return Padding(
      padding: EdgeInsets.all(
        padding,
      ),
      child: SvgPicture.asset(
        image,
        fit: fit,
        height: (staticDim) ? height : height.h,
        width: (staticDim) ? width : width.h,
        placeholderBuilder: (BuildContext context) => (showProgressIndicator)
            ? SizedBox(
                height: progressIndicatorSize.h,
                width: progressIndicatorSize.h,
                child: CircularProgressIndicator(
                  color: progressIndicatorColor,
                  strokeWidth: progressIndicatorSize / 2.5,
                ))
            : const SizedBox(),
      ),
    );
  }

  Widget showSVGImage(String image,
      {double padding = 0,
      double height = 100,
      double width = 100,
      double progressIndicatorSize = 11,
      Color progressIndicatorColor = AppColors.colorPrimary,
      bool ofWidth = false,
      BoxFit fit = BoxFit.contain,
      Color? color}) {
    return Padding(
      padding: EdgeInsets.all(
        padding,
      ),
      child: SvgPicture.asset(
        image,
        fit: fit,
        height: height.h,
        width: width.w,
        placeholderBuilder: (BuildContext context) => Center(
          child: SizedBox(
              height: progressIndicatorSize.h,
              width: progressIndicatorSize.h,
              child: CircularProgressIndicator(
                color: progressIndicatorColor,
                strokeWidth: progressIndicatorSize / 2.5,
              )),
        ),
      ),
    );
  }

  Widget circularProfileimage({required String? imageUrl, double radius = 35}) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.whiteColor, shape: BoxShape.circle),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(radius), // Image radius
          child: imageUrl == null
              ? const CircleAvatar(
                  child: Text("A"),
                )
              : CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Shimmer(
                        gradient: shimmerGradient(),
                        child: const CircleAvatar(radius: 38));
                  },
                ),
        ),
      ),
    );
  }

  shimmerGradient() {
    return LinearGradient(
      colors: [Colors.white, Colors.grey[300]!, Colors.white],
      stops: const [0.0, 0.5, 1.0],
    );
  }
}
