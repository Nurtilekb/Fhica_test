import 'package:appp/describe_card.dart';
import 'package:appp/places_in_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescDesc extends StatefulWidget {
  const DescDesc({super.key, required this.name});
  final String name;
  @override
  State<DescDesc> createState() => _DescDescState();
}

class _DescDescState extends State<DescDesc> {
  int selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Color(0xffE9E9E9),
              child: Center(child: BackButton(color: Colors.black)),
            ),
            Spacer(),
            Center(
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'interTight',
                ),
              ),
            ),
            Spacer(),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Color(0xffE9E9E9),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              width: 343.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: const Color(0xffE9E9E9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment:
                        selectedIndex == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: 164.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Color(0xff00a5df),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                              _pageController.animateToPage(
                                0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 8.h),
                            height: 40.h,
                            alignment: Alignment.center,
                            child: Text(
                              'Places',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color:
                                    selectedIndex == 0
                                        ? Colors.white
                                        : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'interTight',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                              _pageController.animateToPage(
                                1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 8.h),
                            height: 40.h,
                            alignment: Alignment.center,
                            child: Text(
                              'Finance',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color:
                                    selectedIndex == 1
                                        ? Colors.white
                                        : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'interTight',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              children: [ListPlaces(), Finance()],
            ),
          ),
        ],
      ),
    );
  }
}

class Finance extends StatelessWidget {
  const Finance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text('Finance')));
  }
}
