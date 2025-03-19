import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripList extends StatelessWidget {
  const TripList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(0, 124, 233, 238),
          padding: EdgeInsets.only(top: 90.h),
          margin: EdgeInsets.symmetric(vertical: 15.h),
          width: 343.w,
          height: 594.h,
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Image.asset('assets/pngs/roadmap.png', width: 164.w),
              SizedBox(height: 15.h),
              Text(
                "You didn't create the trip",

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "interTight",
                  color: Color(0xFF07242F),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  height: 66.h,
                  width: 280.w,
                  child: Text(
                    "Create your first trippy inter-city trip!",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontFamily: "interTight",
                      color: Color(0xFF000000),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00a5df),
                  minimumSize: Size(343.w, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Add a city',
                  style: TextStyle(
                    color: Color(0xFFEDFAFF),
                    fontSize: 16.sp,
                    fontFamily: "interTight",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
