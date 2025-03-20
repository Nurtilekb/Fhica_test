import 'package:appp/list.trips/2.1.2.dart';
import 'package:appp/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Box<Trip> tripBox;

  @override
  void initState() {
    super.initState();
    tripBox = Hive.box<Trip>('trips'); // Открываем коробку с поездками
  }

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
                  'Add a city',
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
    );
  }
}

//   Widget _buildEmptyTripsUI() {
//     return Center(
//       child: Container(
//         padding: EdgeInsets.only(top: 90.h),
//         margin: EdgeInsets.symmetric(vertical: 15.h),
//         width: 343.w,
//         height: 594.h,
//         child: Column(
//           children: [
//             Image.asset('assets/pngs/roadmap.png', width: 164.w),
//             SizedBox(height: 15.h),
//             Text(
//               "You've created less than two cities",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: "interTight",
//                 color: Color(0xFF07242F),
//                 fontSize: 24.sp,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 margin: EdgeInsets.symmetric(vertical: 18.h),
//                 height: 66.h,
//                 width: 280.w,
//                 child: Text(
//                   "To create a trip you need to create at least two cities to combine into one itinerary map",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: "interTight",
//                     color: Color(0xFF000000),
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 90.h),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF00a5df),
//                 minimumSize: Size(343.w, 56.h),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(32.r),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Trip_creat()),
//                 );
//               },
//               child: Text(
//                 'Add a city',
//                 style: TextStyle(
//                   color: Color(0xFFEDFAFF),
//                   fontSize: 16.sp,
//                   fontFamily: "interTight",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTripsList(Box<Trip> box) {
//     return ListView.builder(
//       itemCount: box.length,
//       itemBuilder: (context, index) {
//         final trip = box.getAt(index);
//         return ListTile(
//           title: Text(trip?.name ?? "Unnamed Trip"),
//           subtitle: Text("Cities: ${trip?.cities.length ?? 0}"),
//           trailing: IconButton(
//             icon: Icon(Icons.delete, color: Colors.red),
//             onPressed: () {
//               box.deleteAt(index);
//             },
//           ),
//         );
//       },
//     );
//   }
// }
