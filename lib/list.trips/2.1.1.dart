import 'package:appp/list.trips/2.1.2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 90.h),
          margin: EdgeInsets.symmetric(vertical: 15.h),
          width: 343.w,
          height: 594.h,
          child: Column(
            children: [
              Image.asset('assets/pngs/roadmap.png', width: 164.w),
              SizedBox(height: 15.h),
              Text(
                "You've created less than two cities",

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "interTight",
                  color: Color(0xFF07242F),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 18.h),
                  height: 66.h,
                  width: 280.w,
                  child: Text(
                    "To create a trip you need to create at least two cities to combine into one itinerary map",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontFamily: "interTight",
                      color: Color(0xFF000000),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 90.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00a5df),
                  minimumSize: Size(343.w, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Trip_creat()),
                  );
                },
                child: Text(
                  'Create a trip',
                  style: TextStyle(
                    color: Color(0xFFEDFAFF),
                    fontSize: 16.sp,
                    fontFamily: "interTight",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: NavBarr(
      //   selectedIndex: _selectedIndex,
      //   onitemtap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
    );
  }
}

// class NavBarr extends StatefulWidget {
//   const NavBarr({
//     super.key,
//     required this.selectedIndex,
//     required this.onitemtap,
//   });

//   @override
//   State<NavBarr> createState() => _NavBarrState();
//   final int selectedIndex;
//   final Function(int) onitemtap;
// }

// class _NavBarrState extends State<NavBarr> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Color(0xFFE9E9E9),
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: const Color(0xFF00a5df),
//       unselectedItemColor: Color(0xff1D506266),
//       currentIndex: widget.selectedIndex,
//       onTap: widget.onitemtap,
//       unselectedLabelStyle: TextStyle(
//         fontFamily: "interTight",
//         color: Color(0xff1D506266),
//         fontSize: 11.sp,
//         fontWeight: FontWeight.w500,
//       ),
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: SizedBox(
//             width: 18.w,
//             height: 21.h,
//             child: Image.asset(
//               widget.selectedIndex == 0
//                   ? 'assets/pngs/vector1.png'
//                   : 'assets/pngs/vector1.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           label: 'Main',
//         ),
//         BottomNavigationBarItem(
//           icon: SizedBox(
//             height: 18.75.h,
//             width: 13.5.w,
//             child: Image.asset(
//               widget.selectedIndex == 1
//                   ? 'assets/pngs/vector2.1.png'
//                   : 'assets/pngs/vector2.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           label: 'Go Trip',
//         ),
//         BottomNavigationBarItem(
//           icon: SizedBox(
//             width: 18.w,
//             height: 18.75.h,
//             child: Image.asset(
//               widget.selectedIndex == 2
//                   ? 'assets/pngs/vector3.png'
//                   : 'assets/pngs/vector3.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           label: 'Analytics',
//         ),
//         BottomNavigationBarItem(
//           icon: SizedBox(
//             width: 19.62.w,
//             height: 19.62.h,
//             child: Image.asset(
//               widget.selectedIndex == 3
//                   ? 'assets/pngs/vector4.png'
//                   : 'assets/pngs/vector4.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           label: 'Settings',
//         ),
//       ],
//     );
//   }
// }
