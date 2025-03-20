import 'dart:ui';

import 'package:appp/desc_desc.dart';
import 'package:appp/describe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Citydatas extends StatelessWidget {
  const Citydatas({super.key, required this.citydatas, required this.name1});

  final List citydatas;
  final String name1;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    const List images = <String>[
      "assets/images/paris.png",
      "assets/images/hotelmunich.png",
      "assets/images/ekinchi.png",
      "assets/images/labrado.png",
      "assets/images/shark.png",
    ];

    return ListView.builder(
      controller: _scrollController,
      itemCount: citydatas.length,
      itemBuilder: (context, index) {
        String imagePath =
            index < images.length ? images[index] : "assets/images/default.png";
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DescDesc(name: citydatas[index]),
              ),
            );
          },
          child: Container(
            height: 266.h,
            margin: EdgeInsets.only(bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.only(top: 10.h, bottom: 8.h),
                  width: 343.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        citydatas[index],
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'interTight',
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Wrap(
                        spacing: 4.w,
                        runSpacing: 4.h,
                        children: List.generate(6, (index) => HotelSirc()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
