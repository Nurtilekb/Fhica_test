import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_theme.dart';

/// Оптимизированная кнопка с кэшированным стилем
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
    this.width,
    this.height,
  });

  // Кэшируем стиль кнопки для избежания пересоздания
  static final ButtonStyle _enabledStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.primaryColor,
    minimumSize: Size(AppTheme.buttonWidth, AppTheme.buttonHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
    ),
    elevation: 0,
  );

  static final ButtonStyle _disabledStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.disabledGray,
    minimumSize: Size(AppTheme.buttonWidth, AppTheme.buttonHeight),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
    ),
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: isEnabled ? _enabledStyle : _disabledStyle,
      onPressed: isEnabled ? onPressed : null,
      child: Text(
        text,
        style: AppTheme.buttonLabel(
          color: isEnabled ? AppTheme.primaryLight : Colors.white70,
        ),
      ),
    );
  }
}

/// Оптимизированная карточка TripCard
class TripCard extends StatelessWidget {
  final String title;
  final int citiesCount;
  final VoidCallback onTap;

  const TripCard({
    super.key,
    required this.title,
    required this.citiesCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: AppTheme.cardMargin,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/pngs/planes.png',
                fit: BoxFit.cover,
                // Используем кэширование изображения
                cacheHeight: 160,
                cacheWidth: 343,
              ),
            ),
            Container(
              height: 160.h,
              width: 343.w,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: AppTheme.fontFamily,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 4.h,
                      children: [
                        _buildChip('Places to visit: 39'),
                        _buildChip('Cities: $citiesCount'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppTheme.overlayWhite,
        borderRadius: BorderRadius.circular(AppTheme.chipRadius),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontFamily: AppTheme.fontFamily,
        ),
      ),
    );
  }
}

/// Переключатель табов с анимацией
class AnimatedTabSwitcher extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const AnimatedTabSwitcher({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      width: 343.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: AppTheme.backgroundGray,
        borderRadius: BorderRadius.circular(48.r),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: AppTheme.animationDuration,
            curve: AppTheme.animationCurve,
            alignment: selectedIndex == 0
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: 164.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(32),
                boxShadow: AppTheme.activeShadow,
              ),
            ),
          ),
          Row(
            children: List.generate(tabs.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTabSelected(index),
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: EdgeInsets.only(top: 8.h),
                    height: 40.h,
                    alignment: Alignment.center,
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppTheme.fontFamily,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
