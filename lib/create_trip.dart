import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({super.key});

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  List<bool> _checkboxValues = List<bool>.filled(10, false);
  List contrys = <String>[
    "Paris",
    "Munich",
    "London",
    "Oslo",
    "Helsinki",
    "Krakow",
  ];

  int lengthofList = 0;

  @override
  void initState() {
    super.initState();
    lengthofList = contrys.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Trip',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
            fontFamily: 'interTight',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name trip',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'interTight',
                ),
              ),
              SizedBox(height: 5.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Write a name trip',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'interTight',
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 15.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(20, 36, 47, 13),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Select cities',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'interTight',
                ),
              ),
              SizedBox(height: 10.h),
              Column(
                children: List.generate(lengthofList, (i) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(20, 36, 47, 13),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      title: Transform.translate(
                        offset: Offset(-14.w, 0),
                        child: Text(
                          contrys[i],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'interTight',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _checkboxValues[i],
                      onChanged: (bool? value) {
                        setState(() {
                          _checkboxValues[i] = value ?? false;
                        });
                      },
                      activeColor: Color(0xFF00a5df),
                      checkColor: Colors.white,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
