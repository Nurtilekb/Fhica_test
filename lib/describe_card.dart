import 'package:appp/datas_of_city.dart';
import 'package:appp/edit_trip.dart';
import 'package:appp/trip_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:flutter/gestures.dart';

class DescribeCard extends StatefulWidget {
  const DescribeCard({super.key, required this.title, required this.cityies});
  final String title;
  final List cityies;

  @override
  State<DescribeCard> createState() => _DescribeCardState();
}

class _DescribeCardState extends State<DescribeCard> {
  void showTripOptions(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => EditTrip(
                            tripIndex: 1,
                            trip: Trip(
                              name: widget.title, // Используй widget.name
                              cities:
                                  widget.cityies
                                      .cast<
                                        String
                                      >(), // Или передай реальные города
                            ),
                          ),
                    ),
                  );
                },
                child: Text("Edit", style: TextStyle(fontSize: 17.sp)),
              ),
              CupertinoActionSheetAction(
                isDestructiveAction: true, // Красный цвет для удаления
                onPressed: () {
                  _showDeleteModal();
                },
                child: Text("Delete", style: TextStyle(fontSize: 17.sp)),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel", style: TextStyle(fontSize: 17.sp)),
            ),
          ),
    );
  }

  void _showDeleteModal() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Do you really want to delete?',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'interTight',
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Once deleted, your data will be lost with no possibility of recovery',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'interTight',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffE9E9E9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () async {
                      var box = Hive.box<Trip>('trips');

                      dynamic tripKeyToDelete;
                      for (var key in box.keys) {
                        var trip = box.get(key);
                        if (trip != null && trip.name == widget.title) {
                          tripKeyToDelete = key;
                          break;
                        }
                      }

                      if (tripKeyToDelete != null) {
                        await box.delete(tripKeyToDelete);
                        print('Удален Trip с ключом: $tripKeyToDelete');
                      } else {
                        print('Trip не найден');
                      }

                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  int selectedIndex = 0;

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
                widget.title,
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
                  onPressed: () {
                    showTripOptions(context);
                  },
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
            child: IndexedStack(
              index: selectedIndex,
              children: [
                Citydatas(citydatas: widget.cityies, name1: widget.title),
                Container(
                  child: Center(child: Text('Add your amounts in page')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotelSirc extends StatelessWidget {
  const HotelSirc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.w, bottom: 2.h),
      height: 23.h,
      width: 75.w,
      decoration: BoxDecoration(
        color: Color.fromARGB(51, 156, 153, 153),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          "Hotels:1",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
